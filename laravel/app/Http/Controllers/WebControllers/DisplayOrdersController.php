<?php

namespace App\Http\Controllers\WebControllers;

use Carbon\Carbon;
use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Order_Details;
use App\Models\User;
use App\Models\Category;
use Illuminate\Support\Facades\Validator;
use App\Models\Medicine;
use App\Models\Warehouse;
use App\Models\Warehouse_Medicine;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DisplayOrdersController extends Controller
{
    public function DisplayOrders(){
        $user = Auth::user();

        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        $warehouse = Warehouse::where('user_id', $user->id)->first();

        if (!$warehouse) {
            return response()->json(['error' => 'Warehouse not found'], 404);
        }

        $orders = $warehouse->orders()->select('id', 'user_id','created_at' , 'status' , 'paid')->get();
        $formattedOrders = $orders->map(function ($order) {
            $userId = $order->user_id;
            //$username =User::where('id',$userId)->first('username');
            return [
                'id' => $order->id,
                'user_id' => $order->user_id,
                'username' => User::where('id', $userId)->value('username'),
                'created_day' => Carbon::parse($order->created_at)->toDateString(),
                'status' => $order->status,
                'paid' => $order->paid,
            ];
        });


        return response()->json([$formattedOrders ,200]);
    }
}
