<?php

namespace App\Http\Controllers\ApplicationControlleres;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
class UserProfileController extends Controller
{
        public function profile(){  
            $user = User::findOrFail(Auth::user()->id);
            $data = [
              "user_id" => Auth::user()->id,
              "username" => $user->username,
              "phone"=> $user->phone,
              "city" => $user->city,
              "gender" => $user->gender,
              "created_at" => $user->created_at->format("Y-m-d"),
              "picture" => $user->picture
            ];
            return response()->json([$data],200);
        }
}
