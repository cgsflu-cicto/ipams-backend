<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AnnualInvestmentPlan;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class AnnualInvestmentPlanController extends Controller
{
    public function index(Request $request){
        $perPage = $request->get('per_page', 10);
        $year = $request->get('year');
        $officeId = $request->get('office_id');

        $query = AnnualInvestmentPlan::orderBy('created_at', 'desc');
                        
        if ($year) {
            $query->where('aip_year', $year);
        }

        if ($officeId) {
            $query->where('office_id', $officeId);
        }

        $aips = $query->paginate($perPage);

        return response()->json([
            'message' => 'AIP records retrieved successfully.',
            'filters' => [
                'year' => $year,
                'office_id' => $officeId,
            ],
            'data' => $aips
        ]);
    }
    
    // save aip
    public function store(Request $request){
        $validated = $request->validate([
            'aip_code' => 'required|string|max:255|unique:annual_investment_plans,aip_code',
            'ppa' => 'required|string',
            'office_id' => 'required|exists:offices,id',
            'aip_year' => 'nullable|numeric|max:4',
            'start_date' => 'nullable|date',
            'completion_date' => 'nullable|date|after_or_equal:start_date',
            'expected_outputs' => 'nullable|string',
            'funding_source_id' => 'nullable|exists:funding_sources,id',
            'personal_services' => 'nullable|numeric|min:0',
            'mooe' => 'nullable|numeric|min:0',
            'capital_outlay' => 'nullable|numeric|min:0',
            'cc_adaptation' => 'nullable|string|max:255',
            'cc_mitigation' => 'nullable|string|max:255',
            'cc_topology_code' => 'nullable|string|max:255',
        ]);

        // Optional: Only Admin or Planning can create AIPs
        if (!in_array($request->user()->access_level, ['Admin', 'Planning'])) {
            return response()->json([
                'message' => 'Unauthorized. Only Admin or Planning can create AIPs.'
            ], 403);
        }

        $aip = AnnualInvestmentPlan::create($validated);

        return response()->json([
            'message' => 'Annual Investment Plan created successfully.',
            'data' => $aip
        ], 201);
    }

    //show specific aip
    public function show($id){
        $aip = AnnualInvestmentPlan::find($id);

        if (!$aip) {
            return response()->json([
                'message' => 'Annual Investment Plan not found.'
            ], 404);
        }

        return response()->json([
            'message' => 'AIP record retrieved successfully.',
            'data' => $aip
        ]);
    }

    //update dito
    public function update(Request $request, $id)
    {
        $aip = AnnualInvestmentPlan::find($id);

        if (!$aip) {
            return response()->json([
                'message' => 'Annual Investment Plan not found.'
            ], 404);
        }

        $validated = $request->validate([
            'aip_year' => ['required', 'integer'],
            'aip_code' => ['required', 'string', 'max:50'],
            'ppa' => ['required', 'string'],
            'office_id' => ['required', 'integer'],
            'aip_year' => ['required', 'integer'],
            'start_date' => ['nullable', 'date'],
            'completion_date' => ['nullable', 'date'],
            'expected_outputs' => ['nullable', 'string'],
            'funding_source_id' => ['nullable', 'integer'],
            'personal_services' => ['nullable', 'numeric'],
            'mooe' => ['nullable', 'numeric'],
            'capital_outlay' => ['nullable', 'numeric'],
            'cc_adaptation' => ['nullable', 'string'],
            'cc_mitigation' => ['nullable', 'string'],
            'cc_topology_code' => ['nullable', 'string', 'max:50'],
        ]);

        $aip->update($validated);

        return response()->json([
            'message' => 'AIP record updated successfully.',
            'data' => $aip
        ]);
    }

}
