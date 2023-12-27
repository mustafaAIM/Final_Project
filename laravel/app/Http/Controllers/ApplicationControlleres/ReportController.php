<?php

namespace App\Http\Controllers\ApplicationControlleres;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ReportController extends Controller
{
    public function report($start_date,$end_date){
          $validator = Validator::make(['start_date' => $start_date, 'end_date' => $end_date], [
              'start_date' => 'required|date',
              'end_date' => 'required|date|after:start_date',
          ]);

          if ($validator->fails()) {
              return response()->json(['errors' => $validator->errors()], 400);
          }

          $orders = Order::whereBetween('created_at', [$start_date, $end_date])->get();
          
          if(Count($orders) == 0 ){
            return response()->json(['no orders between the given dates'],400);
          }

          $total_price = 0;
          $data = [
            "orders" => [],
          ];
          $medicines = [];
          foreach($orders as $order){
                if(Auth::user()->id != $order -> user_id)
                    continue;
                $data["orders"][]=[
                    "order_id" => $order->id,
                    "status" => $order->status,
                    "craeted_at" => $order ->created_at->format("Y-m-d"),
                    "estimated_date" => $order ->estimated_date,
                ];
                
                foreach($order->ordered_medicines as $medicine){
                        $medicines[] = [
                          "scientific_name" => $medicine->scientific_name,
                          "price" => $medicine-> pivot->price,
                          "quantity" => $medicine ->pivot->quantity,
                          "expirydate" =>$medicine ->pivot ->expirydate

                        ];
                }
                $total_price += $order -> total;
          }
          $medicines = collect($medicines);

          $groupedMedicines = $medicines->reduce(function ($carry, $item) {
            $key = $item['scientific_name'];
            if (!isset($carry[$key])) {
                $carry[$key] = [
                    'scientific_name' => $key,
                    'price' => $item['price'],
                    'quantity' => $item['quantity'],
                ];
            } else {
                $carry[$key]['quantity'] += $item['quantity'];
            }
            return $carry;
           }, []);
          
          $groupedMedicines = array_values($groupedMedicines);
          $data["medicines"]= $groupedMedicines;
          $data["total_price"] = $total_price;
          return response()->json([$data],200);
    }
}
