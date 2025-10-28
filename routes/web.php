<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::fallback(function () {
    return response()->json([
        'message' => 'Route not found. Please check your endpoint or HTTP method.'
    ], 404);
});
