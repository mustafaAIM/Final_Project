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
                              ->get(['medicines.id',   'scientific_name','trading_name','category_id']);
                              
          if(count($medicine)==0){
              return response()->json([
              'not found'
            ],404);
          }

          $medicine = $medicine->map(function ($item) {
              $category = Category::findOrFail($item->category_id);
              $item->category = $category->category;
              unset($item->category_id);
              return $item;
          });

          return response()->json([
                  'medicines' => $medicine
          ],200);
}
}
