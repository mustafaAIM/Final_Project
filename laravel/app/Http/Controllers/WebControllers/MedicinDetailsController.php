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

class MedicinDetailsController extends Controller
{
    public function getMedicine($medicineId)
    {
        $userID = Auth::user()->id;
        $warehouse = Warehouse::where('user_id', $userID)->first();

        if (!$warehouse) {
            return response()->json(['error' => 'Warehouse not found'], 404);
        }

        $medicines = $warehouse->medicines()->where('medicine_id', $medicineId)->get();

        if (!$medicines) {
            return response()->json(['error' => 'Medicine not found in the warehouse'], 404);
        }

        $info =[];
        foreach ($medicines as $medicine) {
            $pivot = $medicine->pivot;
            $info[] = array(
                "quantity" => $pivot->quantity,
                "expiration" => $pivot->expirydate
            );
        }

        $formattedMedicine = [
            "trading_name" => $medicine->trading_name,
            "scientific_name" => $medicine->scientific_name,
            "manufacturer_company" =>$medicine->manufacturer_company,
            'category' => $medicine->category->category,
            "price" => $medicine->pivot->price,
        ];
        $formattedMedicine['info'] = $info;

        return response()->json($formattedMedicine);
    }
}
