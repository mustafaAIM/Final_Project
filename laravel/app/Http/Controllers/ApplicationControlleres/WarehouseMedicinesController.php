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
        $transformedMedicines = $medicines->map(function ($medicine) {
            return [
                'id' => $medicine->id,
                'scientific_name' => $medicine->scientific_name,
                'trading_name' => $medicine->trading_name,
                'category' => $medicine->category->category,
                'manufacturer_company' => $medicine->manufacturer_company,
                'price' => $medicine->pivot->price,
                'quantity' => $medicine->pivot->quantity,
                'expirydate' => $medicine->pivot->expirydate,
            ];
        });
        $categories = $medicines->pluck('category.category')->unique();
        return response()->json([
            'message' => 'Medicines retrieved successfully',
            'medicines' => $transformedMedicines,
            'categories'=>$categories->values()
        ], 200);
    }
}
