<?php

namespace App\Http\Controllers;

use App\Models\BaiViet;
use App\Models\DiaDanh;
use App\Models\HinhAnhBaiViet;
use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
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
        $diadanh=DiaDanh::all();
        $user=User::all();
        $baiviet=BaiViet::all();
        return view('baiviet-index',['lstbaiviet'=>$baiviet,'lstdiadanh'=>$diadanh,'lstuser'=>$user]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $diadanh=DiaDanh::all();
        $user=User::all();
        return view('baiviet-add',['lstdiadanh'=>$diadanh,'lstuser'=>$user]);
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
        $validator=$request->validate([
            'tieude'=>'required|max:255|string',
            'mota'=>'required|string',
            'dia_danhs_id'=>'required',
            'user_id'=>'required'
        ]);
        $baiviet=BaiViet::create($input);
        $inputImg['hinhanh']='';
        $inputImg['dia_danhs_id']=$baiviet['dia_danhs_id'];
        $inputImg['bai_viets_id']=$baiviet['id'];
        $inputImg['trangthai']='1';
        if($request->hasFile('images')){
            foreach($request->file('images') as $key => $file)
            {
                $path = $file->store('admin_view/assets/images/baiviet/'.$baiviet['id'],'public');
                $inputImg['hinhanh']=$path;
                $hinhAnh=HinhAnhBaiViet::create($inputImg);
            }
        }
        
        return Redirect::route('baiviet.index',['lstbaiviet'=>$baiviet]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\BaiViet  $baiviet
     * @return \Illuminate\Http\Response
     */
    public function show(BaiViet $baiviet)
    {
        
         

        // $user=User::join('bai_viets','bai_viets.user_id','=','users.id')
        // ->where('bai_viets.id',$baiviet)
        // ->select('bai_viets.*','users.email')->get();
        $diadanh=BaiViet::join('dia_danhs','dia_danhs.id','=','bai_viets.dia_danhs_id')->where('bai_viets.id',$baiviet)
        ->select('dia_danhs.tendiadanh','bai_viets.*')->first();
        $hinhAnh=HinhAnhBaiViet::join('bai_viets','bai_viets.id','=','hinh_anh_bai_viets.bai_viets_id')
        ->select('bai_viets.*','hinh_anh_bai_viets.hinhanh')->get();
        foreach($hinhAnh as $ha)
        {
           $this->FixImg($ha); 
        }
        return view('baiviet-detail',['baiviet'=>$baiviet,'lstHinhAnh'=>$hinhAnh,'diaDanh'=>$diadanh,'User'=>$baiviet->user]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\BaiViet  $baiViet
     * @return \Illuminate\Http\Response
     */
    public function edit(BaiViet $baiViet)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\BaiViet  $baiViet
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, BaiViet $baiViet)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\BaiViet  $baiViet
     * @return \Illuminate\Http\Response
     */
    public function destroy(BaiViet $baiViet)
    {
        //
    }
}