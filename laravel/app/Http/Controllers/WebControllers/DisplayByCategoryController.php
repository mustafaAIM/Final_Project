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

class DisplayByCategoryController extends Controller
{
    public function filter($category)
    {
        $userID = Auth::user()->id;
        $warehouse = Warehouse::where('user_id', $userID)->first();

        if (!$warehouse) {
            return response()->json(['error' => 'Warehouse not found'], 404);
        }

        $categoryName = Category::where('category', $category)->first();

        if (!$categoryName) {
            return response()->json(['error' => 'Category not found'], 404);
        }

        $category_id = $categoryName->id;

        $medicines = $warehouse->medicines()->where('category_id', $category_id)->get();

        if (!$medicines) {
            return response()->json(['error' => 'Medicine not found'], 404);
        }

        $formattedMedicines = array();

        // Group medicines by medicine_id and calculate total quantity
        $groupedMedicines = $medicines->groupBy('pivot.medicine_id');
        foreach ($groupedMedicines as $medicineGroup) {
            $totalQuantity = $medicineGroup->sum('pivot.quantity');

            // Take the first medicine in the group to get its details
            $medicine = $medicineGroup->first();

            $formattedMedicines[] = array(
                "medicine_id" => $medicine->pivot->medicine_id,
                "trading_name" => $medicine->trading_name,
                "scientific_name" => $medicine->scientific_name,
                "total_quantity" => $totalQuantity,
                "manufacturer_company" => $medicine->manufacturer_company,
            );
        }

        return response()->json($formattedMedicines);
    }
}
