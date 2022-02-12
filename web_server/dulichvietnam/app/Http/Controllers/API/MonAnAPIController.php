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
    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input=$request->all();
        $validator=Validator::make($input,[
            'ten'=>'required|string|max:255',
            'mota'=>'required|string',
        ]);
        if($validator->fails()){
            if(!empty($validator->errors())){
                $response['data']=$validator->errors();
            }
            $response['message']='Vaidator Error';
            return response()->json($response,404);
        }
        $monan=MonAn::create($input);
        $response=[
            'message'=>'Success',
            'data'=>$monan
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
       $monan=MonAn::find($id);
        if(is_null($luutru))
        return $response['message']='Món ăn không tìm thấy';

        $response=[
            'message'=>'Success',
            'data'=>$monan
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
    public function update(Request $request, MonAn $monan)
    {
        $input=$request->all();
        $validator=Validator::make($input,[
            'ten'=>'required|string|max:255',
            'mota'=>'required|string',
        ]);
        if($validator->fails()){
            if(!empty($validator->errors())){
                $response['data']=$validator->errors();
            }
            $response['message']='Vaidator Error';
            return response()->json($response,404);
        }
       $monan->ten=$input['ten'];
       $monan->diachi=$input['mota'];
       $monan->trangthai=$input['trangthai'];
       $monan->dia_danhs_id=$input['dia_danhs_id'];
        $response=[
            'message'=>'Success',
            'data'=>$monan
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
       $monan=MonAn::find($id)->delete();
        $lstMonAn=MonAn::all();
        $response=[
            'message'=>'Success',
            'data'=>$lstMonAn
        ];
        return response()->json($response,200);
    }
}