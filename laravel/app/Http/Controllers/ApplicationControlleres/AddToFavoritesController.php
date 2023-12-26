<?php

namespace App\Http\Controllers\ApplicationControlleres;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Dotenv\Store\File\Reader;
use Illuminate\Http\Request;
use App\Models\Favorites;

use App\Models\Medicine;
class AddToFavoritesController extends Controller
{
    public function addFavorites(Request $request){
            Medicine::findOrFail($request->medicine_id);
            $user = $request->user();
            $favorites = $user->favourites()
                              ->where('medicine_id',$request->medicine_id)->get();
            if(Count($favorites) != 0)
                return response()->json("added before");
            $request -> user() -> favourites()->attach($request->medicine_id);
            return response()->json(200);
    }
}
