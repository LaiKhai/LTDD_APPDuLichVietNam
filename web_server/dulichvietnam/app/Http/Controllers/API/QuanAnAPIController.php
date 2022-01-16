<?php

namespace App\Http\Controllers\API;

use Illuminate\Support\Collection;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\QuanAn;


class QuanAnAPIController extends Controller
{
    public function index(Request $request){
        $quanan = QuanAn::all();
        $response =[
            'message'=>'Success',
            'data'=>$quanan,
        ];
        return response()->json($response,200); 
    }
}
