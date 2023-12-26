<?php

namespace App\Http\Controllers\WebControllers;
use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Support\Facades\Validator;
use App\Models\Medicine;
use App\Models\Warehouse;
use App\Models\Warehouse_Medicine;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProfileController extends Controller
{
    public function Profile()
    {
        $user = Auth::user();

        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        $warehouse = Warehouse::where('user_id', $user->id)->first();

        if (!$warehouse) {
            return response()->json(['error' => 'Warehouse not found'], 404);
        }

        $formattedMedicines[] = array(
            "username" => $user->username,
            "name" => $warehouse->name,
            "phone" => $user->phone,
            "city" => $user->city,
            "gender" => $user->gender,
            "picture" => $user->picture,
        );

        return response()->json($formattedMedicines);
    }

    public function Editusername(Request $request){
        $user = Auth::user();

        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        $warehouse = Warehouse::where('user_id', $user->id)->first();

        if (!$warehouse) {
            return response()->json(['error' => 'Warehouse not found'], 404);
        }

        $validator = Validator::make($request->all(), [
            'username' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        //'username'=>$request->username;
        $user->username = $request->username;
        $user->save();

        $formattedMedicines[] = array(
            "username" => $user->username,
            "name" => $warehouse->name,
            "phone" => $user->phone,
            "city" => $user->city,
            "gender" => $user->gender,
            "picture" => $user->picture,
        );

        return response()->json($formattedMedicines);

    }

    public function EditWarehouseName(Request $request){

        $user = Auth::user();

        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        $warehouse = Warehouse::where('user_id', $user->id)->first();

        if (!$warehouse) {
            return response()->json(['error' => 'Warehouse not found'], 404);
        }

        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        //'username'=>$request->username;
        $warehouse->name = $request->name;
        $warehouse->save();

        $formattedMedicines[] = array(
            "username" => $user->username,
            "name" => $warehouse->name,
            "phone" => $user->phone,
            "city" => $user->city,
            "gender" => $user->gender,
            "picture" => $user->picture,
        );

        return response()->json($formattedMedicines);
    }
    public function EditPicture(Request $request){

        $user = Auth::user();

        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        $warehouse = Warehouse::where('user_id', $user->id)->first();

        if (!$warehouse) {
            return response()->json(['error' => 'Warehouse not found'], 404);
        }

        $validator = Validator::make($request->all(), [
            'picture' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        //'username'=>$request->username;
        $user->picture = $request->picture;
        $user->save();

        $formattedMedicines[] = array(
            "username" => $user->username,
            "name" => $warehouse->name,
            "phone" => $user->phone,
            "city" => $user->city,
            "gender" => $user->gender,
            "picture" => $user->picture,
        );

        return response()->json($formattedMedicines);
    }
}
