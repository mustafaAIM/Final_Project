<?php

namespace App\Http\Controllers\ApplicationControlleres;

use App\Http\Controllers\Controller;
use App\Models\Warehouse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SpecificMedicineController extends Controller{
  public function medicine($id,$medicine_id){
        $warehouse = Warehouse::findOrFail($id);
        $medicines = $warehouse->medicines()->where('medicine_id', $medicine_id)->get();

        if($medicines->isEmpty()){
            return response()->json(
                [
                    "message" => "not found"
                ],
                404
            );
        }

        $info =[];
        $total_quantity = 0;
        foreach ($medicines as $medicine) {
            
                $pivot = $medicine->pivot;
                $info[] = array(
                    "quantity" => $pivot->quantity,
                    "expiration" => $pivot->expirydate
                );
                $total_quantity += $pivot->quantity;
            
        }

        $medicine_i =  [
            'id' => $medicine_id, 
            'scientific_name' => $medicine->scientific_name,
            'trading_name' => $medicine->trading_name,
            'category' => $medicine->category->category,
            'manufacturer_company' => $medicine->manufacturer_company,
            'price' => $medicine->pivot->price,
        ];
          
        $medicine_i['info'] = $info;
        $medicine_i['total_quantity'] = $total_quantity;
        
        $user = Auth::user();
        $prefrences = $user ->favorites ; 
        $medicine_i['favorites'] = false;
        foreach($prefrences as $prefrence){
          if($prefrence->scientific_name === $medicine_i["scientific_name"])
                $medicine_i['favorites'] = true;
        }

        return response()->json(['medicine'=>$medicine_i],200);
      }

}