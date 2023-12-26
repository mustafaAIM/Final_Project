<?php

namespace App\Http\Controllers\ApplicationControlleres;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
class OrderDetailsController extends Controller
{
    public function orderDetails($id){
            $order = Order::findOrFail($id);
            $order_details = $order -> ordered_medicines;
            
            $data = [
              "total_price" => $order->total,
              "medicines" => []
            ];
            foreach($order_details as $detail){  
                    $data["medicines"][]=[
                          "trading_name" => $detail->trading_name,
                          "quantity" => $detail->pivot->quantity,
                          "price" => $detail->pivot -> price ,
                          "expirydate" => $detail->pivot ->expirydate
                      ];
            }

            return response()->json([
                $data
            ]);  
    }
} 