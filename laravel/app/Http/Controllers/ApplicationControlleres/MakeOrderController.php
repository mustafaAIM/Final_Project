<?php

namespace App\Http\Controllers\ApplicationControlleres;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Carbon\Carbon;
use App\Models\Warehouse;
use App\Models\Warehouse_Medicine;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
class MakeOrderController extends Controller
{
    public function order(Request $request){

            $validator = Validator::make($request->all(), [
                'warehouse_id' => 'required|int',
                'medicines' => 'required|array',
            ]);

            if($validator->fails())
                return response()->json(422);

            $order = Order::create([
                "user_id"=>$request->user()->id,
                "warehouse_id"=>$request->warehouse_id,
                "estimated_date" => Carbon::create()->now()->addDays(15),
                "total" => 0
            ]);
            $total = 0;
            $warehouse = Warehouse::findOrFail($request->warehouse_id);
            $order_medicines = $request->medicines;
            foreach($order_medicines as $medicine){
                    $remaining_quantity = $medicine["quantity"];
                    $warehouse_medicines = $warehouse->medicines()->where('medicine_id',$medicine["medicine_id"])->orderBy('expirydate')->get();
                    foreach($warehouse_medicines as $warehouse_medicine){
                        if($remaining_quantity <= 0)
                                break;
                        if($warehouse_medicine -> pivot -> quantity == 0)
                            continue;

                        if($remaining_quantity >= $warehouse_medicine -> pivot -> quantity){
                            $remaining_quantity -= $warehouse_medicine -> pivot -> quantity;
                            $data = [
                            "price" => $warehouse_medicine -> pivot -> price ,
                            "quantity" => $warehouse_medicine -> pivot -> quantity,
                            "expirydate" => $warehouse_medicine -> pivot -> expirydate,
                            ];
                            $total += $data["price"]*$data["quantity"];
                            $order -> ordered_medicines() -> attach($medicine["medicine_id"],$data);
                        $s =   Warehouse_Medicine::where("expirydate",$warehouse_medicine->pivot->expirydate)
                                                ->where("medicine_id",$medicine["medicine_id"])->first();
                        $s ->quantity =  0;
                        $s -> save();
                        }
                        else{


                        $data = [
                            "price" => $warehouse_medicine -> pivot -> price ,
                            "quantity" => $remaining_quantity,
                            "expirydate" => $warehouse_medicine -> pivot -> expirydate,
                        ];
                        $total += $data["price"]*$data["quantity"];
                        $order -> ordered_medicines() -> attach($medicine["medicine_id"],$data);
                        $s =   Warehouse_Medicine::where("expirydate",$warehouse_medicine->pivot->expirydate)
                                                ->where("medicine_id",$medicine["medicine_id"])->first();
                        $s -> quantity  -= $remaining_quantity ;
                        $s -> save();
                        $remaining_quantity = 0 ;
                        }
                    }

            }

            $order -> total = $total ;
            $order ->save();


            return response()->json([
            'order created successfully' => $order
            ],200);
    }
}
