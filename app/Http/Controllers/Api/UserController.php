<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    //show all user but with paginateion
    public function index(Request $request){
        $authUser = $request->user();

        // check if si Admin
        if ($authUser->access_level !== 'Admin') {
            return response()->json([
                'message' => 'Unauthorized. Only Admin can update users.'
            ], 403);
        }
        
        $perPage = $request->get('per_page', 10);

        $users = User::orderBy('created_at', 'desc')->paginate($perPage);

        return response()->json([
            'message' => 'Users retrieved successfully',
            'data' => $users
        ]);
    }

    //show specific useer
    public function show(Request $request, $id)
    {
        $authUser = $request->user();

        // check if si Admin
        if ($authUser->access_level !== 'Admin') {
            return response()->json([
                'message' => 'Unauthorized. Only Admin can update users.'
            ], 403);
        }

        $user = User::find($id);

        if (!$user) {
            return response()->json([
                'message' => 'User not found'
            ], 404);
        }

        return response()->json([
            'message' => 'User retrieved successfully',
            'data' => $user
        ]);
    }

    //update if admin can update all field if user password only
    public function update(Request $request, $id){
        $authUser = $request->user();

        // Find user to update
        $user = User::find($id);
        if (!$user) {
            return response()->json([
                'message' => 'User not found.'
            ], 404);
        }

        // If not admin, allow only self password update
        if ($authUser->access_level !== 'Admin' && $authUser->id != $id) {
            return response()->json([
                'message' => 'Unauthorized. You can only update your own password.'
            ], 403);
        }

        // Validation rules differ for Admin and regular user
        if ($authUser->access_level === 'Admin') {
            $validated = $request->validate([
                'username' => ['sometimes', 'string', 'max:50', Rule::unique('users', 'username')->ignore($user->id)],
                'email' => ['sometimes', 'email', 'max:100', Rule::unique('users', 'email')->ignore($user->id)],
                'full_name' => ['sometimes', 'string', 'max:150'],
                'sex' => ['nullable', Rule::in(['Male', 'Female'])],
                'access_level' => ['sometimes', Rule::in(['Admin', 'Planning', 'Budget', 'BAC', 'Departments'])],
                'office_id' => ['nullable', 'integer'],
                'password' => ['nullable', 'string', 'min:8', 'confirmed'],
            ]);
        } else {
            // Regular user can only update password
            $validated = $request->validate([
                'password' => ['required', 'string', 'min:8', 'confirmed'],
            ]);
        }

        // Hash password if present
        if (!empty($validated['password'])) {
            $validated['password'] = Hash::make($validated['password']);
        }

        // Update user record
        $user->fill($validated);
        $user->save();

        return response()->json([
            'message' => 'User updated successfully.',
            'data' => $user
        ], 200);
    }

    //soft delete
    public function destroy($id){
        $authUser = request()->user();

        if ($authUser->access_level !== 'Admin') {
            return response()->json([
                'message' => 'Unauthorized. Only Admin can delete users.'
            ], 403);
        }

        $user = User::find($id);

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        $user->delete(); // ✅ soft delete, not permanent

        return response()->json([
            'message' => 'User deleted successfully (soft deleted).'
        ]);
    }

    public function restore($id){
        $user = User::withTrashed()->find($id);

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        $user->restore();

        return response()->json([
            'message' => 'User restored successfully.',
            'user' => $user
        ]);
    }

}
