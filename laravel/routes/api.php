<?php

use App\Http\Controllers\ApplicationAuth\LogoutController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApplicationAuth\RegisterationController;
use App\Http\Controllers\ApplicationAuth\LoginController;
use App\Http\Controllers\ApplicationControlleres\AddPictureController;
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
Route::middleware(['auth:api', 'user.type:Pharmacist'])->group( function () {
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
    Route::post('add-picture',[AddPictureController::class,'addPicture']);
    
});
Route::post('register-pharmacist',[RegisterationController::class,'register']);
Route::post('login-pharmacist',[LoginController::class,'login'])->name('login');



// Web Routes
Route::post('register-warehouse' , [WebRegisterationController::class ,'register']);
Route::post('login-warehouse' , [WebLoginController::class ,'login']);
Route::post('create-medicine',[CreateMedicineController::class, 'create']);

Route::middleware('auth:api')->group( function () {
    Route::post('logout-warehouse',[WebLogoutController::class,'logout']);
});
