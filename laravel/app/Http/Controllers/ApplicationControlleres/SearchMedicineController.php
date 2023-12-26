<?php

namespace App\Http\Controllers\ApplicationControlleres;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Warehouse;
use App\Models\Category;
class SearchMedicineController extends Controller
{
  public function searchMedicines($id,$query) {
    $warehouse = Warehouse::findOrFail($id);

    $medicine = $warehouse->medicines()->where('scientific_name', 'LIKE', "%$query%")
                        ->orWhere('trading_name', 'LIKE', "%$query%")
                        ->first(['medicines.id',   'scientific_name','trading_name','category_id']);

    if(!$medicine){
        return response()->json([
        'not found'
        ],404);
    }

    $category = Category::findOrFail($medicine->category_id);
    $medicine->category = $category->category;
    unset($medicine->category_id);
    $medicine->price = $medicine->pivot->price; // Add a price field to the medicine

    return response()->json([
        'medicine' => [
            'id' => $medicine->id,
            'scientific_name' => $medicine->scientific_name,
            'price' => $medicine->price
        ]
    ],200);
}


}
