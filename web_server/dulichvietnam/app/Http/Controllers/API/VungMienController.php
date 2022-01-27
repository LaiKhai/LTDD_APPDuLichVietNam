<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\VungMien;

class VungMienController extends Controller
{
    public function index(){
        $vungmien = VungMien::all();
        $response =[
            'message'=>'Success',
            'data'=>$vungmien,
        ];
        return response()->json($response,200);
    }
}