<?php

namespace App\Http\Controllers\ApplicationAuth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Warehouse;
use Illuminate\Support\Facades\Validator;

class RegisterationController extends Controller
{
    public function register(Request $request){
        $validator = Validator::make($request->all(), [
                'username' => 'required|string|max:255',
                'phone' => 'required|string|unique:users|regex:/^09\d{8}$/',
                'password' => 'required|string|min:8',
                'city' => 'required|string|max:255',
                'gender' => 'required|string|in:male,female',
                'type' => 'required|string|max:255|in:pharmacist,Warehouse Owner',
          ]);

          if($validator->fails()) {
              return response()->json(['errors' => $validator->errors()], 422);
          }

          $user = User::create([
              'username' => $request->username,
              'phone' => $request->phone,
              'password' => bcrypt($request->password),
              'city' => $request->city,
              'gender' => $request->gender,
              'type' => $request->type,
          ]);

          //test
          if($request->input('type')==="Warehouse Owner"){
              Warehouse::create([
                  "name" => $request->input('name'),
                  "user_id"=> $user->id
              ]);
          }

          $token = $user->createToken('MyApp')->accessToken;
          return response()->json(['token' => $token], 200);

    }
}
