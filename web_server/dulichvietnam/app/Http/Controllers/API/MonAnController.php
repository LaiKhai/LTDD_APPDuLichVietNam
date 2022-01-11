<?php

namespace App\Http\Controllers\API;

use Illuminate\Support\Collection;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MonAn;

class MonAnController extends Controller
{
    public function index(){
        $monan = MonAn::all();
        $response =[
            'message'=>'Success',
            'data'=>$monan,
        ];
        return response()->json($response,200);
    }
}