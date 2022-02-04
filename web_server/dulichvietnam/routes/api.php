<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\MonAnAPIController;
use App\Http\Controllers\API\LuuTruController;
use App\Http\Controllers\API\QuanAnAPIController;
use App\Http\Controllers\API\DiaDanhController;
use App\Http\Controllers\API\VungMienController;
use App\Http\Controllers\API\BaiVietController;

Route::post('register',[AuthController::class,'register']);
Route::post('login',[AuthController::class,'login']);
Route::apiResource('diadanh',DiaDanhController::class);
Route::apiResource('baiviet',BaiVietController::class);
Route::apiResource('vungmien', VungMienController::class);
Route::apiResource('luutru',LuuTruController::class);
Route::apiResource('quanan',QuanAnAPIController::class);
Route::apiResource('monan',MonAnAPIController::class);
Route::middleware(['auth:sanctum'])->group(function(){
    Route::post('logout',[AuthController::class,'logout']);
});