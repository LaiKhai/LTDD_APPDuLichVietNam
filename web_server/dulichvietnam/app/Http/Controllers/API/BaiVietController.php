<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\BaiViet;
use App\Models\User;
use App\Models\HinhAnhBaiViet;
use Illuminate\Support\Facades\DB;

use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;

class BaiVietController extends Controller
{
    public function FixImg(HinhAnhBaiViet $hinhAnh)
    {
        if(Storage::disk('public')->exists($hinhAnh->hinhanh)){
            $hinhAnh->hinhanh=Storage::url($hinhAnh->hinhanh);
        }
        else{
            $hinhAnh->hinhanh='/admin_view/assets/images/No_Image.png';
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $baiviet=BaiViet::join('users','bai_viets.user_id','=','users.id')
        ->select('bai_viets.*','users.hoten')->orderBy('created_at','desc')->get();
        $response =[
            'message'=>'Success',
            'data'=>$baiviet,
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
        $input['tieude']=$request->input('tieude');
        $input['mota']=$request->input('mota');
        $input['trangthai']=$request->input('trangthai');
        $input['dia_danhs_id']=$request->input('dia_danhs_id');
        $input['user_id']=$request->input('user_id');
        $input['hinhanh']=$request->file('hinhanh');
        $validator=Validator::make($input,[
            'tieude'=>'required|string|max:255',
            'mota'=>'required|string',
        ]);
        if($validator->fails()){
            if(!empty($validator->errors())){
                $response['data']=$validator->errors();
            }
            $response['message']='Vaidator Error';
            return response()->json($response,404);
        }
        $baiviet=BaiViet::create($input);
        $response=[
            'message'=>'Success',
            'data'=>$baiviet
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
        $baiviet=BaiViet::find($id);
        if(empty($baiviet)){
            $response['message']='không tìm thấy bài viết';
            return response()->json($response,404);
        }
        $response=[
            'message'=>'Thành Công',
            'data'=>$baiviet
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
    public function update(Request $request, BaiViet $baiviet)
    {
        $input=$request->all();
        $validator=Validator::make($input,[
            'tieude'=>'required|string|max:255',
            'mota'=>'required|string',
        ]);
        if($validator->fails()){
            if(!empty($validator->errors())){
                $response['data']=$validator->errors();
            }
            $response['message']='Vaidator Error';
            return response()->json($response,404);
        }
        $baiviet->tieude=$input['tieude'];
        $baiviet->mota=$input['mota'];
        $baiviet->trangthai=$input['trangthai'];
        $baiviet->dia_danhs_id=$input['dia_danhs_id'];
        $baiviet->user_id=$input['user_id'];
        $response=[
            'message'=>'Success',
            'data'=>$baiviet
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
        $baiviet=BaiViet::find($id)->delete();
        $lstbaiviet=BaiViet::all();
        $response=[
            'message'=>'Success',
            'data'=>$lstbaiviet
        ];
        return response()->json($response,200);
    }
}