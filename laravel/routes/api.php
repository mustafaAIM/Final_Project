<?php

use App\Http\Controllers\ApplicationAuth\LogoutController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApplicationAuth\RegisterationController;
use App\Http\Controllers\ApplicationAuth\LoginController;
use App\Http\Controllers\ApplicationControlleres\AddToFavoritesController;
use App\Http\Controllers\ApplicationControlleres\GetFavoritesController;
use App\Http\Controllers\ApplicationControlleres\ListOrdersController;
use App\Http\Controllers\ApplicationControlleres\MakeOrderController;
use App\Http\Controllers\ApplicationControlleres\MedicinesByCategoryController;
use App\Http\Controllers\ApplicationControlleres\OrderDetailsController;
use App\Http\Controllers\ApplicationControlleres\ReportController;
use App\Http\Controllers\ApplicationControlleres\SearchMedicineController;
use App\Http\Controllers\ApplicationControlleres\SpecificMedicineController;
use App\Http\Controllers\ApplicationControlleres\UserProfileController;
use App\Http\Controllers\ApplicationControlleres\WarehouseController;
use App\Http\Controllers\ApplicationControlleres\WarehouseMedicinesController;
/*
|--------------------------------------------------------------------------
| Web Controllers
|--------------------------------------------------------------------------
*/
use App\Http\Controllers\WebAuth\WebRegisterationController;
use App\Http\Controllers\WebAuth\WebLoginController;
use App\Http\Controllers\WebAuth\WebLogoutController;
use App\Http\Controllers\WebControllers\CreateMedicineController;
use App\Http\Controllers\WebControllers\ReadMedicinesController;
use App\Http\Controllers\WebControllers\MedicinDetailsController;
use App\Http\Controllers\WebControllers\DisplayByCategoryController;
use App\Http\Controllers\WebControllers\ProfileController;
use App\Http\Controllers\WebControllers\StatusesController;
use App\Http\Controllers\WebControllers\WReportController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


//Application Routes


Route::middleware('auth:api')->group( function () {
    Route::post('logout',[LogoutController::class,'logout']);
    Route::get('warehouses',[WarehouseController::class,'warehouses']);
    Route::get('warehouses/{id}',[WarehouseMedicinesController::class,'getMedicines']);
    Route::get('warehouses/{id}/{medicine_id}',[SpecificMedicineController::class,'medicine']);
    Route::get('get-medicines-by-category/{warehouse_id}/{category}',[MedicinesByCategoryController::class,'getMedicinesByCategories']);
    Route::get('search/{id}/{query}',[SearchMedicineController::class,'searchMedicines']);
    Route::post('make-order',[MakeOrderController::class,'order']);
    Route::get('orders',[ListOrdersController::class,'listOrders']);
    Route::get('order-details/{id}',[OrderDetailsController::class,'orderDetails']);
    Route::post('add-to-favorites',[AddToFavoritesController::class,'addFavorites']);
    Route::get('favorites',[GetFavoritesController::class,'favorites']);
    Route::get('profile',[UserProfileController::class,'profile']);
    Route::get('report/{start_date}/{end_date}',[ReportController::class,'report']);

});
Route::post('register-pharmacist',[RegisterationController::class,'register']);
Route::post('login-pharmacist',[LoginController::class,'login'])->name('login');



// Web Routes
Route::post('register-warehouse' , [WebRegisterationController::class ,'register']);
Route::post('login-warehouse' , [WebLoginController::class ,'login']);



Route::middleware('auth:api')->group( function () {
    Route::post('logout-warehouse',[WebLogoutController::class,'logout']);
    Route::post('create-medicine',[CreateMedicineController::class, 'create']);
    Route::get('display-medicines',[ReadMedicinesController::class, 'getWarehouseMedicines']);
    Route::get('display-medicine-details/{medicineId}',[MedicinDetailsController::class, 'getMedicine']);
    Route::get('fillter-by/{category_id}',[DisplayByCategoryController::class ,'filter']);
    Route::get('profile',[ProfileController::class ,'Profile']);
    Route::post('editusername',[ProfileController::class ,'Editusername']);
    Route::post('editwarehousename',[ProfileController::class ,'EditWarehouseName']);
    Route::post('editpicture',[ProfileController::class ,'EditPicture']);
    Route::post('change-status',[StatusesController::class ,'ChangeStatuses']);
    Route::get('report',[WReportController::class,'report']);
});
