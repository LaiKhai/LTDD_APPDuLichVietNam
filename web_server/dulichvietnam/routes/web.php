<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MonAnController;
use App\Http\Controllers\DiaDanhController;
use App\Http\Controllers\VungMienController;
use App\Http\Controllers\LuuTruController;
use App\Http\Controllers\QuanAnController;
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

Route::get('/', [HomeController::class,'index']);

Route::get('login',[LoginController::class,'show'])->name('login');
Route::resource('monan', MonAnController::class);
Route::resource('luutru', LuuTruController::class);
Route::resource('quanan', QuanAnController::class);
Route::resource('diadanh', DiaDanhController::class);
Route::resource('vungmien', VungMienController::class);