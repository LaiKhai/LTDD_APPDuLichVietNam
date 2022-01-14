<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use App\Models\LuuTru;

class LuuTruController extends Controller
{
    public function index(){
        $luutru = LuuTru::all();
        $response =[
            'message'=>'Success',
            'data'=>$luutru,
        ];
        return response()->json($response,200);
    }
}
