<?php

namespace App\Http\Controllers\API;

use Illuminate\Support\Collection;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MonAn;

class MonAnAPIController extends Controller
{
    public function index(Request $request){
        $monan = MonAn::all();
        $response =$monan;
      
        return response()->json($response,200); 
    }
}