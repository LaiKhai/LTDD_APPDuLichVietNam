<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DiaDanh;
use Illuminate\Support\Facades\Validator;


class DiaDanhController extends Controller
{
    public function index(){
        // $diadanh = DiaDanh::orderBy('created_at','desc')->withCount('likes')->get();
        $diadanh=DiaDanh::join('vung_miens','dia_danhs.vung_miens_id','=','vung_miens.id')
        ->select('dia_danhs.*','vung_miens.tenvungmien')->orderBy('created_at','desc')->withCount('likes')->get();
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
            'tendiadanh' => 'required|string|max:255',
            'mota' => 'required|string',
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
        $diadanh=DiaDanh::join('vung_miens','dia_danhs.vung_miens_id','=','vung_miens.id')
        ->select('dia_danhs.*','vung_miens.tenvungmien')->withCount('likes')->get();
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
    public function update(Request $request, $id)
    {
        $diadanh=DiaDanh::find($id);
        if(!$diadanh){
            return response()->json(['messgae'=>'Không tìm thấy địa danh nào !',403]);
        }
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
        $diadanh=DiaDanh::find($id);
        if(!$diadanh){
            return response(['message'=>'Không tìm thấy địa danh']);
        }
        $lstdiadanh=DiaDanh::all();
        $diadanh->likes_diadanh()->delete();
        $diadanh->delete();
        $response=[
            'message'=>'Success',
            'data'=>$lstdiadanh
        ];
        return response()->json($response,200);
    }
}