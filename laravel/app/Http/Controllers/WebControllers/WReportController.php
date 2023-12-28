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

class WReportController extends Controller
{
    public function report()
    {
        $user = Auth::user();

        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        $warehouse = Warehouse::where('user_id', $user->id)->first();

        if (!$warehouse) {
            return response()->json(['error' => 'Warehouse not found'], 404);
        }

        $orders = $warehouse->orders()->get();

        $orderCount = count($orders);

        $uniqueUserIdsCount = $orders->pluck('user_id')->unique()->count();

        $uniqueUserIds = $orders->pluck('user_id')->unique();
        $usernames = User::whereIn('id', $uniqueUserIds)->pluck('username')->implode(', ');

        $totalOfAllTotals = $orders->sum('total');
        $total = 0;

        // Initialize arrays for medicine quantities and percentages
        $medicineQuantities = [];
        $totalQuantity = 0;
        $medicinePercentages = [];

        // Initialize array for daily order totals
        $dailyOrderTotals = [];

        // Loop through each order
        foreach ($orders as $order) {
            $orderDate = Carbon::parse($order->created_at)->toDateString();

            // Calculate the total quantity of medicines for each order
            foreach ($order->ordered_medicines as $medicine) {
                $medicineId = $medicine->trading_name;
                $quantity = $medicine->pivot->quantity;

                if (!isset($medicineQuantities[$medicineId])) {
                    $medicineQuantities[$medicineId] = 0;
                }

                $medicineQuantities[$medicineId] += $quantity;
                $totalQuantity += $quantity;
            }

            // Calculate the percentage of total quantity for each medicine
            foreach ($medicineQuantities as $medicineId => $quantity) {
                $percentage = ($quantity / $totalQuantity) * 100;
                $medicinePercentages[$medicineId] = $percentage;
            }

            // Calculate the total price of the order
            $total += $order->total;

            // Calculate the date of the day
            $currentDate = Carbon::now()->toDateString();

            // Calculate the date of the previous 30 days
            $previous30Days = Carbon::now()->subDays(30)->toDateString();

            // If the order date is within the last 30 days, add the total to the corresponding day
            if ($orderDate >= $previous30Days && $orderDate <= $currentDate) {
                if (!isset($dailyOrderTotals[$orderDate])) {
                    $dailyOrderTotals[$orderDate] = 0;
                }

                $dailyOrderTotals[$orderDate] += $order->total;
            }
        }

        return response()->json([
            'orderCount' => $orderCount,
            'uniqueUserIdsCount' => $uniqueUserIdsCount,
            'mostRepeatedUsername' => $usernames,
            'totalOfAllTotals' => $totalOfAllTotals,
            'medicinePercentages' => $medicinePercentages,
            'dailyOrderTotals' => $dailyOrderTotals,
        ], 200);
    }
}
