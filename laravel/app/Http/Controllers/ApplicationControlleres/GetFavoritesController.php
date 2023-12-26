<?php

namespace App\Http\Controllers\ApplicationControlleres;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Medicine;
use App\Models\Warehouse_Medicine;

class GetFavoritesController extends Controller
{
      public function favorites(){
            $user = Auth::user();
            $favorites = $user -> favorites;
            $data = [];
            foreach($favorites as $item){
              $medicine = Medicine::find($item -> pivot -> medicine_id);
              $data [] = [
                "id" => $medicine->id,
                "trading_name" => $medicine->trading_name,
              ];
            }
            return response()->json($data);      
      }
}
