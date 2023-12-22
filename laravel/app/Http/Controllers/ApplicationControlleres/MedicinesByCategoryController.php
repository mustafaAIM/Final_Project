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
          return response()->json([
            'medicines' => $transformedMedicines
          ],200);
    }
}
