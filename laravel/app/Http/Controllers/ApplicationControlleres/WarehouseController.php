<?php

namespace App\Http\Controllers\ApplicationControlleres;

use App\Http\Controllers\Controller;
use App\Models\Warehouse;
use Illuminate\Http\Request;
use Psr\Http\Message\ResponseInterface;

class WarehouseController extends Controller
{
    public function warehouses(){
        $warehouses = Warehouse::all();
        if(count($warehouses) == 0){
            return response()->json([
                "message" => "no warehouses yet"
            ],404);
        }
        $formatted_warehouses = array();
        foreach ($warehouses as $warehouse) {
            $formatted_warehouses[] = array(
                "warehouse_id" => $warehouse->id,
                "name" => $warehouse->name
            );
        }
        return response()->json([
            "warehouses" => $formatted_warehouses
        ],200);
  }
  
}
