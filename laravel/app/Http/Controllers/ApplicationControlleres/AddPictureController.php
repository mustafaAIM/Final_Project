<?php

namespace App\Http\Controllers\ApplicationControlleres;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AddPictureController extends Controller
{
    public function addPicture(Request $request){
        $user = Auth::user();
        $validetion = Validator::make($request->all(),[
          "picture" => 'required|string'
        ]);
        if($validetion->fails()){
          return response()->json(["error"=>$validetion->errors()],400);
        }
        $user->picture = $request->picture;
        $user->save();
        return response()->json([
          'picture' => $user->picture
        ]);
    }
}
