<?php

use App\Http\Controllers\ApplicationAuth\LogoutController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApplicationAuth\RegisterationController;
use App\Http\Controllers\ApplicationAuth\LoginController;
use App\Http\Controllers\ApplicationControlleres\MedicinesByCategoryController;
use App\Http\Controllers\ApplicationControlleres\SearchMedicineController;
use App\Http\Controllers\ApplicationControlleres\WarehouseMedicinesController;

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
    Route::get('warehouse/{id}',[WarehouseMedicinesController::class,'getMedicines']);
    Route::get('get-medicines-by-category/{warehouse_id}/{category}',[MedicinesByCategoryController::class,'getMedicinesByCategories']);
    Route::get('search/{id}/{query}',[SearchMedicineController::class,'searchMedicines']);

});

Route::post('register-pharmacist',[RegisterationController::class,'register']);
Route::post('login-pharmacist',[LoginController::class,'login'])->name('login');



