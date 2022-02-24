<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use App\Models\LuuTru;
use Illuminate\Support\Facades\Validator;

use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
class LuuTruController extends Controller
{
   public function FixImg(LuuTru $luutru)
    {
        if(Storage::disk('public')->exists($luutru->hinhanh)){
            $luutru->hinhanh=Storage::url($luutru->hinhanh);
        }
        else{
            $luutru->hinhanh='/admin_view/assets/images/No_Image.png';
        }
    }
    public function index(){
        $luutru=LuuTru::join('dia_danhs','luu_trus.dia_danhs_id','=','dia_danhs.id')
        ->select('luu_trus.*','dia_danhs.tendiadanh')->orderBy('created_at','desc')->get();
        foreach($luutru as $lt){
                $this->fixImg($lt);
        }
        $response =[
            'message'=>'Success',
            'data'=>$luutru,
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
        $luutru=LuuTru::create($input);
        $response=[
            'message'=>'Success',
            'data'=>$luutru
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
        $luutru=LuuTru::join('dia_danhs','luu_trus.dia_danhs_id','=','dia_danhs.id')
        ->select('luu_trus.*','dia_danhs.tendiadanh')->get();
        if(is_null($luutru))
        return $response['message']='Lưu trú không tìm thấy';

        $response=[
            'message'=>'Success',
            'data'=>$luutru
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
    public function update(Request $request, LuuTru $luutru)
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
        $luutru->ten=$input['ten'];
        $luutru->diachi=$input['diachi'];
        $luutru->sdt=$input['sdt'];
        $luutru->trangthai=$input['trangthai'];
        $luutru->dia_danhs_id=$input['dia_danhs_id'];
        $luutru->save();
        $response=[
            'message'=>'Success',
            'data'=>$luutru
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
        $luutru=LuuTru::find($id)->delete();
        $lstLuuTru=LuuTru::all();
        $response=[
            'message'=>'Success',
            'data'=>$lstLuuTru
        ];
        return response()->json($response,200);
    }
}