<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\VungMien;
use Illuminate\Support\Facades\Validator;

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
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
     public function store(Request $request)
    {
        $input=$request->all();
        $validator = Validator::make($input, [
            'tenvungmien' => 'required'
        ]);
        if($validator->fails()){
            if(!empty($validator->errors()))
            $response['data']=$validator->errors();
            
            $response=[
                'message'=>'Validator Error',
            ]; 
            return response()->json($response,404);
        }
        $vungmien=VungMien::create($input);
         $response=[
                'message'=>'Success',
                'data'=>$vungmien
            ];
            return response()->json($response,200);
    }
     /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $vungmien=VungMien::find($id);
        if(empty($vungmien)){
            $response['message']='không tìm thấy bài viết';
            return response()->json($response,404);
        }
        $response=[
            'message'=>'Thành Công',
            'data'=>$vungmien
        ];
        return response()->json($response,200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, VungMien $vungmien)
    {
        $input=$request->all();
        $validator=Validator::make($input,[
            'tenvungmien'=>'required|string|max:255'
        ]);
        if($validator->fails()){
            if(!empty($validator->errors())){
                $response['data']=$validator->errors();
            }
            $response['message']='Vaidator Error';
            return response()->json($response,404);
        }
        $vungmien->tenvungmien=$input['tenvungmien'];
        $response=[
            'message'=>'Success',
            'data'=>$vungmien
        ];
        return response()->json($response,200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $vungmien=VungMien::find($id)->delete();
        $lstvungmien=VungMien::all();
        $response=[
            'message'=>'Success',
            'data'=>$lstvungmien
        ];
        return response()->json($response,200);
    }
}