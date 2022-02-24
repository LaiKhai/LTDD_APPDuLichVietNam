<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MonAnController;
use App\Http\Controllers\DiaDanhController;
use App\Http\Controllers\VungMienController;
use App\Http\Controllers\LuuTruController;
use App\Http\Controllers\QuanAnController;
use App\Http\Controllers\BaiVietController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\NhuCauController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Route::get('login',[LoginController::class,'index'])->name('login');
Route::post('login',[LoginController::class,'authenticate'])->name('login');

Route::middleware('can:isAdmin')->group(function(){
     Route::get('/', [HomeController::class,'index']);
    Route::resource('monan', MonAnController::class);
    Route::resource('user', UserController::class);
    Route::resource('luutru', LuuTruController::class);
    Route::resource('quanan', QuanAnController::class);
    Route::resource('diadanh', DiaDanhController::class);
    Route::patch('update', [DiaDanhController::class,"update2"])->name('update');
    Route::resource('vungmien', VungMienController::class);
    Route::resource('baiviet', BaiVietController::class);
    Route::resource('nhucau', NhuCauController::class);
    Route::post('dangxuat',[LoginController::class,'logout'])->name('dangxuat');
});