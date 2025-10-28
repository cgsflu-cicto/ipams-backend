<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes; 


class AnnualInvestmentPlan extends Model
{
    //
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'aip_code',
        'ppa',
        'office_id',
        'aip_year',
        'start_date',
        'completion_date',
        'expected_outputs',
        'funding_source_id',
        'personal_services',
        'mooe',
        'capital_outlay',
        'cc_adaptation',
        'cc_mitigation',
        'cc_topology_code',
    ];
    
    protected $dates = ['deleted_at'];
}
