<?php

namespace App\Http\Controllers\API;

use Illuminate\Support\Collection;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\QuanAn;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;

class QuanAnAPIController extends Controller
{
    
    public function fixImg(QuanAn $quanan){
        if(Storage::disk('public')->exists($quanan->hinhanh))
        {
            $quanan->hinhanh=Storage::url($quanan->hinhanh);
        }
        else{
            $quanan->hinhanh='/admin_view/assets/images/No_Image.png';
        }
    }
    public function index(Request $request){
        $quanan=QuanAn::join('dia_danhs','quan_ans.dia_danhs_id','=','dia_danhs.id')
        ->select('quan_ans.*','dia_danhs.tendiadanh')->orderBy('created_at','desc')->get();
         foreach($quanan as $qa){
                $this->fixImg($qa);
        }
        $response =[
            'message'=>'Success',
            'data'=>$quanan,
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
        $validator=Validator::make($input,[
            'ten'=>'required|string|max:255',
            'diachi'=>'required|string',
            'sdt'=>'required|string',
     

        ]);
        if($validator->fails()){
            if(!empty($validator->errors())){
                $response['data']=$validator->errors();
            }
            $response['message']='Vaidator Error';
            return response()->json($response,404);
        }
       $quanan=QuanAn::create($input);
        $response=[
            'message'=>'Thành công',
            'data'=>$quanan
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
        $quanan=QuanAn::join('dia_danhs','quan_ans.dia_danhs_id','=','dia_danhs.id')
        ->select('quan_ans.*','dia_danhs.tendiadanh')->orderBy('created_at','desc')->get();
        if(is_null($quanan))
        return $response['message']='Quán ăn không tìm thấy';

        $response=[
            'message'=>'Success',
            'data'=>$quanan
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
    public function update(Request $request, QuanAn $quanan)
    {
        $input=$request->all();
        $validator=Validator::make($input,[
            'ten'=>'required|string|max:255',
            'diachi'=>'required|string',
            'sdt'=>'required|string',
        ]);
        if($validator->fails()){
            if(!empty($validator->errors())){
                $response['data']=$validator->errors();
            }
            $response['message']='Vaidator Error';
            return response()->json($response,404);
        }
       $quanan->ten=$input['ten'];
       $quanan->diachi=$input['diachi'];
       $quanan->trangthai=$input['trangthai'];
       $quanan->dia_danhs_id=$input['dia_danhs_id'];
        $response=[
            'message'=>'Success',
            'data'=>$quanan
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
        $quanan=QuanAn::find($id)->delete();
        $lstQuanAn=QuanAn::all();
        $response=[
            'message'=>'Success',
            'data'=>$lstQuanAn
        ];
        return response()->json($response,200);
    }
}