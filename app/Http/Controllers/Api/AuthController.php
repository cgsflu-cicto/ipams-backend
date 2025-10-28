<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    // Register - Only Admins can create users
    public function register(Request $request){
        // Ensure only Admin can create users
        $user = $request->user();
        if (!$user || $user->access_level !== 'Admin') {
            return response()->json(['message' => 'Unauthorized. Only Admin can create users.'], 403);
        }

        // Normalize the access level input (to handle case insensitivity)
        $request->merge([
            'access_level' => ucfirst(strtolower($request->input('access_level'))),
        ]);

        // Validate incoming data
        $data = $request->validate([
            'username' => ['required', 'string', 'max:50', 'unique:users,username'],
            'email' => ['required', 'email', 'max:100', 'unique:users,email'],
            'full_name' => ['required', 'string', 'max:150'],
            'sex' => ['nullable', Rule::in(['Male', 'Female'])],
            'access_level' => ['required', Rule::in(['Admin', 'Planning', 'Budget', 'BAC', 'Departments'])],
            'office_id' => ['nullable', 'integer', 'exists:offices,id'],
            'password' => ['required', 'string', 'min:8', 'confirmed'], // expects password_confirmation
        ]);

        // Create the new user
        $user = User::create([
            'username' => $data['username'],
            'email' => $data['email'],
            'full_name' => $data['full_name'],
            'sex' => $data['sex'] ?? null,
            'access_level' => $data['access_level'],
            'office_id' => $data['office_id'] ?? null,
            'password' => Hash::make($data['password']),
        ]);

        return response()->json([
            'message' => 'User created successfully',
            'user' => $user,
        ], 201);
    }

    // Login - Username or email-based login
    public function login(Request $request){
        $data = $request->validate([
            'username' => ['required', 'string'],
            'password' => ['required', 'string'],
        ]);

        // Allow login by username or email
        $user = User::where('username', $data['username'])
                    ->orWhere('email', $data['username'])
                    ->first();

        if (! $user || ! Hash::check($data['password'], $user->password)) {
            throw ValidationException::withMessages([
                'username_or_email' => ['The provided credentials are incorrect.'],
            ]);
        }

        // Generate a new token for the user
        $token = $user->createToken('api-token')->plainTextToken;

        return response()->json([
            'message' => 'Login successful',
            'user' => $user,
            'token' => $token,
        ]);
    }

    // Logout - Revoke current token
    public function logout(Request $request){
        // Remove the current access token
        $request->user()->currentAccessToken()->delete();

        return response()->json(['message' => 'Logged out']);
    }

    // Get the authenticated user's details
    public function me(Request $request){
        return response()->json($request->user());
    }

}
