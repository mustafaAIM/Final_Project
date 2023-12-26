<?php

namespace App\Http\Controllers\ApplicationControlleres;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Warehouse;
class MedicinesByCategoryController extends Controller
{
      public function getMedicinesByCategories($id, $category) {
        $warehouse = Warehouse::findOrFail($id);
        $category_id = Category::where('category', $category)->firstOrFail()->id;
        $medicines = $warehouse->medicines()->where('category_id', $category_id)->get();
        $formatted_medicines = array();
        foreach ($medicines as $medicine) {
            $formatted_medicines[] = array(
                "id" => $medicine->id,
                "scientific_name" => $medicine->scientific_name,
                "price" => $medicine->pivot->price
            );
        }
        $formatted_medicines = collect($formatted_medicines)->unique('scientific_name')->values()->all();

        return response()->json([
            "medicines" => $formatted_medicines
        ],200);

    }

    
}
