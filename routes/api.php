<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\AnnualInvestmentPlanController;

// Public Routes
Route::post('/auth/login', [AuthController::class, 'login']); // No prefix needed here

// Protected Routes (requires authentication)
Route::middleware('auth:sanctum')->group(function () {
    //authentication
    Route::post('/auth/register', [AuthController::class, 'register']); // No extra `auth` prefix
    Route::post('/auth/logout', [AuthController::class, 'logout']);
    //pangtest lang ito
    Route::get('/auth/me', [AuthController::class, 'me']);

    //users
    Route::get('users', [UserController::class, 'index']);    
    Route::get('users/{id}', [UserController::class, 'show']);    
    Route::put('users/{id}', [UserController::class, 'update']);  
    Route::delete('users/{id}', [UserController::class, 'destroy']);
    Route::post('users/{id}/restore', [UserController::class, 'restore']);

    //aip
    Route::get('aip', [AnnualInvestmentPlanController::class, 'index']);
    Route::post('aip', [AnnualInvestmentPlanController::class, 'store']);
    Route::get('aip/{id}', [AnnualInvestmentPlanController::class, 'show']);
    Route::put('aip/{id}', [AnnualInvestmentPlanController::class, 'update']);
    

    
    // Protected example route
    Route::get('/protected-example', function (Illuminate\Http\Request $request) {
        return ['message' => 'You are authenticated', 'user' => $request->user()];
    });
});

//fallback incase link is not found
Route::fallback(function () {
    return response()->json([
        'message' => 'Route not found. Please check your endpoint or HTTP method.'
    ], 404);
});
