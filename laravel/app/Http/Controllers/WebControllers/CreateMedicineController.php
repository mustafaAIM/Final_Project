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


class CreateMedicineController extends Controller
{
    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'scientific_name' => 'required|string|max:255',
            'trading_name' => 'required|string|max:255',
            'manufacturer_company' => 'required|string|max:255',
            'category' => 'required|string|max:255',
            'quantity' => 'required|integer',
            'price' => 'required|numeric',
            'expirydate' => 'required|date',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $userID = Auth::user()->id;
        $warehouse = Warehouse::where('user_id', $userID)->first();

        if (!$warehouse) {
            return response()->json(['error' => 'Warehouse not found.'], 404);
        }

        //$warehouseId = $warehouse->id;

        $medicine = Medicine::where('scientific_name', $request->scientific_name)
            ->where('trading_name', $request->trading_name)
            ->where('manufacturer_company', $request->manufacturer_company)
            ->first();

        if (!$medicine) {
            $categoryName = $request->category;
            $category = Category::firstOrCreate(['category' => $categoryName]);
            $category_id = $category->id;

            $medicine = Medicine::create([
                'scientific_name' => $request->scientific_name,
                'trading_name' => $request->trading_name,
                'manufacturer_company' => $request->manufacturer_company,
                'category_id' => $category_id,
            ]);
        }

        $medicineId = $medicine->id;

        $existingMedicine = $warehouse->medicines()
        ->where('medicine_id', $medicineId)
        ->where('expirydate', $request->expirydate)
        ->first();

    if ($existingMedicine) {
        // If medicine exists in the warehouse with the same expiry date, update the quantity
            $warehouse->medicines()
            ->wherePivot('medicine_id', $medicineId)
            ->wherePivot('expirydate', $request->expirydate)
            ->updateExistingPivot($medicineId, [
            'quantity' => $existingMedicine->pivot->quantity + $request->quantity,
            'price' => $request->price,
        ]);

        return response()->json(['message' => 'Medicine is already exists the quantity updated successfully.'], 200);
    }
    else{
            // If medicine doesn't exist in the warehouse, add it
            $warehouse->medicines()->attach($medicineId, [
                'price' => $request->price,
                'quantity' => $request->quantity,
                'expirydate' => $request->expirydate,
            ]);

            return response()->json(['message' => 'Medicine created successfully.'], 201);
        }
    }
}
