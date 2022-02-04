<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DiaDanh;
use Illuminate\Support\Facades\Validator;


class DiaDanhController extends Controller
{
    public function index(){
        $diadanh = DiaDanh::all();
        $response =[
            'message'=>'Success',
            'data'=>$diadanh,
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
            'tendiadanh' => 'required',
            'mota' => 'required',
            'kinhdo' => 'required',
            'vido' => 'required',
            'vung_miens_id' => 'required'
        ]);
        if($validator->fails()){
            if(!empty($validator->errors()))
            $response['data']=$validator->errors();
            
            $response=[
                'message'=>'Validator Error',
            ]; 
            return response()->json($response,404);
        }
        $diadanh=DiaDanh::create($input);
         $response=[
                'message'=>'Success',
                'data'=>$diadanh
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
        $diadanh=DiaDanh::find($id);
        if(is_null($diadanh))
        return $response['message']='Địa danh không tìm thấy';

        $response=[
            'message'=>'Success',
            'data'=>$diadanh
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
    public function update(Request $request, DiaDanh $diadanh)
    {
        $input=$request->all();

        $diadanh->tendiadanh=$input['tendiadanh'];
        $diadanh->mota=$input['mota'];
        $diadanh->kinhdo=$input['kinhdo'];
        $diadanh->vido=$input['vido'];
        $diadanh->vung_miens_id=$input['vung_miens_id'];
        $diadanh->save();

        $response =[
            'message'=>'Success',
            'data'=>$diadanh
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
        $diadanh=DiaDanh::find($id)->delete();
        $lstdiadanh=DiaDanh::all();
        $response=[
            'message'=>'Success',
            'data'=>$lstdiadanh
        ];
        return response()->json($response,200);
    }
}