<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\MonAnAPIController;
use App\Http\Controllers\API\LuuTruController;
use App\Http\Controllers\API\QuanAnAPIController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('register',[AuthController::class,'register']);
Route::post('login',[AuthController::class,'login']);
Route::get('monan',[MonAnAPIController::class,'index'])->name('mon_an');
Route::get('luutru',[LuuTruController::class,'index'])->name('luu_tru');
Route::get('quanan',[QuanAnAPIController::class,'index'])->name('quan_an');
Route::middleware(['auth:sanctum'])->group(function(){
    Route::post('logout',[AuthController::class,'logout']);
});