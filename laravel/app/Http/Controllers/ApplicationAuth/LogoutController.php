<?php

namespace App\Http\Controllers\ApplicationAuth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LogoutController extends Controller
{
  public function logout(Request $request)
  {
      $request->user()->token()->revoke();

      return response()->json(['message' => 'Successfully logged out'], 200);
  }
}
