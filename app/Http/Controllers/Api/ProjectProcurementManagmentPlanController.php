<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ProjectProcurementManagementPlan;
use App\Models\MilestoneOfActivities;

class ProjectProcurementManagmentPlanController extends Controller
{
    //
    public function index(Request $request){
        //something wrong dito
        $validated = $request->validate([
            'aip_year' => 'required|integer',
            'department_id' => 'required|integer|exists:departments,id',
        ]);

        $ppmp = ProjectProcurementManagementPlan::find(1);
        echo $ppmp;

        // $ppmp = ProjectProcurementManagementPlan::with([
        //             'milestones',
        //             'annualInvestmentPlan' => function ($query) use ($validated) {
        //                 $query->where('aip_year', $validated['aip_year'])
        //                     ->where('office_id', $validated['department_id']);
        //             }
        //         ])
        //         ->whereHas('annualInvestmentPlan', function ($query) use ($validated) {
        //             $query->where('aip_year', $validated['aip_year'])
        //                 ->where('office_id', $validated['department_id']);
        //         })
        //         ->get();
    
        // if ($ppmp->isEmpty()) {
        //     return response()->json([
        //         'message' => 'No PPMP records found for the given year and department.'
        //     ], 404);
        // }

        // return response()->json([
        //     'message' => 'PPMP records retrieved successfully.',
        //     'data' => $ppmp
        // ]);
    }

    // save ppmp
    public function store(Request $request){
        $validated = $request->validate([
            'parent_id' => 'required|integer|exists:annual_investment_plans,id',
            'general_description' => 'required|string|max:255',
            'quantity' => 'required|integer|min:1',
            'estimated_budget' => 'required|numeric|min:0',
            'mode_of_procurement_id' => 'required|integer|exists:mode_of_procurements,id',

            'milestones' => 'required|array|min:1',
            'milestones.*.schedule' => 'required|date',
            'milestones.*.quantity' => 'required|integer|min:1',
        ]);

        // Optional: Only Admin or Planning can create PPMPs depende pa
        if (!in_array($request->user()->access_level, ['Admin', 'Planning'])) { 
            return response()->json([
                'message' => 'Unauthorized. Only Admin or Planning can create AIPs.'
            ], 403);
        }

        $ppmp = ProjectProcurementManagementPlan::create($validated);

        //must be multiple milestone created
        foreach ($validated['milestones'] as $milestone) {
            MilestoneOfActivities::create([
                'parent_id' => $ppmp->id,
                'schedule' => $milestone['schedule'],
                'quantity' => $milestone['quantity'],
            ]);
        }

        return response()->json([
            'message' => 'PPMP created successfully.',
            'data' => $ppmp
        ], 201);
    }

    //show specific aip
    public function show($id){
        // use this code if ppmp id lang ang gagamitin
        $ppmp = ProjectProcurementManagementPlan::with([
                    'milestones',
                    'annual_investment_plan:id,aip_year,office_id' // only fetch needed columns
                ])->find($id);
                
        if (!$ppmp) {
            return response()->json([
                'message' => 'PPMP not found.'
            ], 404);
        }

        return response()->json([
            'message' => 'PPMP record retrieved successfully.',
            'data' => $ppmp
        ]);
    }

    //update dito
    public function update(Request $request, $id)
    {
        $ppmp = ProjectProcurementManagementPlan::find($id);

        if (!$ppmp) {
            return response()->json([
                'message' => 'PPMP not found.'
            ], 404);
        }

        $validated = $request->validate([
            'parent_id' => 'required|integer|exists:annual_investment_plans,id',
            'general_description' => 'required|string|max:255',
            'quantity' => 'required|integer|min:1',
            'estimated_budget' => 'required|numeric|min:0',
            'mode_of_procurement_id' => 'required|integer|exists:mode_of_procurements,id',

            'milestones' => 'nullable|array|min:1',
            'milestones.*.id' => 'nullable|integer|exists:milestone_of_activities,id',
            'milestones.*.schedule' => 'required_with:milestones|date',
            'milestones.*.quantity' => 'required_with:milestones|integer|min:1',
        ]);

        $ppmp->update($validated);

        if (!empty($validated['milestones'])) {
            // Option 1: Delete all and re-insert (simpler)
            $ppmp->milestones()->delete();

            foreach ($validated['milestones'] as $milestone) {
                $ppmp->milestones()->create([
                    'parent_id' => $ppmp->id,
                    'schedule' => $milestone['schedule'],
                    'quantity' => $milestone['quantity'],
                ]);
            }

            // Option 2 (Advanced): Update existing ones if IDs provided
            // foreach ($validated['milestones'] as $milestone) {
            //     if (!empty($milestone['id'])) {
            //         MilestoneOfActivities::where('id', $milestone['id'])->update([
            //             'schedule' => $milestone['schedule'],
            //             'quantity' => $milestone['quantity'],
            //         ]);
            //     } else {
            //         $ppmp->milestones()->create([
            //             'schedule' => $milestone['schedule'],
            //             'quantity' => $milestone['quantity'],
            //         ]);
            //     }
            // }
        }

        return response()->json([
            'message' => 'PPMP record updated successfully.',
            'data' => $ppmp
        ]);
    }

}
