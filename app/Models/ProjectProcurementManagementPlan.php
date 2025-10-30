<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes; 

class ProjectProcurementManagementPlan extends Model
{
    //
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'parent_id',
        'general_description',
        'quantity',
        'estimated_budget',
        'mode_of_procurement_id',
    ];

    public function milestones(){
        return $this->hasMany(MilestoneOfActivities::class, 'parent_id');
    }

    public function annual_investment_plan(){
        return $this->belongsTo(AnnualInvestmentPlan::class, 'parent_id');
    }
}
