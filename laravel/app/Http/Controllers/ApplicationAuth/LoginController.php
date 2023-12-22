<?php

namespace App\Http\Controllers\ApplicationAuth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
class LoginController extends Controller
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

          if (Auth::attempt($credentials)) {
              $token = Auth::user()->createToken('MyApp')->accessToken;
              return response()->json(['token' => $token], 200);
          } else {
              return response()->json(['error' => 'Invalid phone or password'], 401);
          }
      }
}
