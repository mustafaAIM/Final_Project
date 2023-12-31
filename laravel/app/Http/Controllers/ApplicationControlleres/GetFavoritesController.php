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
      $medicine = Medicine::findOrFail($item -> pivot -> medicine_id);
      $price = Warehouse_Medicine::findOrFail($item -> pivot -> medicine_id)->price;
      $data [] = [
        "id" => $medicine->id,
        "trading_name" => $medicine->trading_name,
        "price" => $price
      ];
    }
    return response()->json($data);      
}
}
