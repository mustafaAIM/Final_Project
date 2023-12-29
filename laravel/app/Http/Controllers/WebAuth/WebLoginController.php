<?php

namespace App\Http\Controllers\WebAuth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Warehouse;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class WebLoginController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required|string|regex:/^09\d{8}$/',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $credentials = $request->only('phone', 'password');

        // Attempt to authenticate the user
        if (Auth::attempt($credentials)) {
            // Check the user type after authentication
            if (Auth::user()->type != "Warehouse Owner") {
                Auth::logout(); // Logout the pharmacist user
                return response()->json(['error' => 'Forbidden'], 403);
            }

            // If not a pharmacist, create and return the token
            $token = Auth::user()->createToken('MyApp')->accessToken;
            return response()->json(['token' => $token], 200);
        } else {
            return response()->json(['error' => 'Invalid phone or password'], 401);
        }
    }
}