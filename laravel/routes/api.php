<?php

use App\Http\Controllers\ApplicationAuth\LogoutController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApplicationAuth\RegisterationController;
use App\Http\Controllers\ApplicationAuth\LoginController;
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


Route::post('register-pharmacist',[RegisterationController::class,'register']);
Route::post('login-pharmacist',[LoginController::class,'login'])->name('login');



Route::middleware('auth:api')->group( function () {
    Route::post('logout',[LogoutController::class,'logout']);
});
