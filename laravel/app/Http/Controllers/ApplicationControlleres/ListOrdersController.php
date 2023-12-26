<?php

namespace App\Http\Controllers\ApplicationControlleres;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use Illuminate\Support\Facades\Auth;
class ListOrdersController extends Controller
{
    public function listOrders(){
        $user_id = Auth::user() -> id ;
        $orders = Order::where('user_id',$user_id)->get();
        $data = [];
        foreach($orders as $order){
              $data [] =[
                  'order_id' => $order->id,
                  'status' => $order->status,
                  'created_at' => $order->created_at->format('Y-m-d'),
                  'estimated_date' => $order->estimated_date 
              ];
        }
        return response()->json([
          $data
        ],200);

    }
}
