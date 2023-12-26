<?php

namespace App\Http\Controllers\ApplicationControlleres;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Models\Warehouse;
class WarehouseMedicinesController extends Controller
{
  public function getMedicines($id){
        $warehouse = Warehouse::findOrFail($id);
        $medicines = $warehouse->medicines;
        if(count($medicines) == 0){
            return response()->json([
                "message" => "no medicines yet"
            ],404);
        }
        $formatted_medicines = array();
        foreach ($medicines as $medicine) {
            $formatted_medicines[] = array(
                "id" => $medicine->id,
                "scientific_name" => $medicine->scientific_name,
                "price" => $medicine->pivot->price
            );
        }
        $formatted_medicines = collect($formatted_medicines)->unique('scientific_name')->values()->all();
        $categories = $medicines->pluck('category.category')->unique();
        return response()->json([
            "categories" => $categories->values(),
            "medicines" => $formatted_medicines
        ],200);
  }

}
