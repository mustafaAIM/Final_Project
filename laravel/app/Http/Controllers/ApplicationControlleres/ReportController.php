<?php

namespace App\Http\Controllers\ApplicationControlleres;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
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
          return response()->json([$orders],200);


    }
}
