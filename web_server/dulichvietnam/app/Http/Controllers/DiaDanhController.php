<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DiaDanh;
use App\Models\VungMien;
use App\Models\HinhAnh;
use App\Models\NhuCau;
use App\Models\DiaDanh_NhuCau;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class DiaDanhController extends Controller
{
    public function FixImg(HinhAnh $hinhAnh)
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
        $diadanh=DiaDanh::join('vung_miens','dia_danhs.vung_miens_id','=','vung_miens.id')
        ->select('dia_danhs.*','vung_miens.tenvungmien')->get();
        $vungMien=VungMien::all();
        return view('diadanh-index',['data'=>$diadanh,'lstVungMien'=>$vungMien]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $lstvungmien=VungMien::all();
        $nhucau=NhuCau::all();
        return view('diadanh-add',['lstVungMien'=>$lstvungmien,'lstnhucau'=>$nhucau]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input['tendiadanh']=$request->input('tendiadanh');
        $input['mota']=$request->input('mota');
        $input['kinhdo']=$request->input('kinhdo');
        $input['vido']=$request->input('vido');
        $input['vung_miens_id']=$request->input('vung_miens_id');
        $input['trangthai']=$request->input('trangthai');
        $validator=$request->validate([
            'tendiadanh'=>'required|string|max:255',
            'mota'=>'required|string',
            'kinhdo'=>'required|max:255',
            'vido'=>'required|max:255',
            'vung_miens_id'=>'required'
        ]);
        $diadanh=DiaDanh::create($input);
        foreach($request->input('nhucau') as $key =>$value){
            $inputNhuCau['nhu_caus_id']=$value;
            $inputNhuCau['dia_danh_id']=$diadanh->id;
            $nhuCau=DiaDanh_NhuCau::create($inputNhuCau);
        }

        return Redirect::route('diadanh.index',['data'=>$diadanh]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @param  App\Models\DiaDanh $diadanh
     * @return \Illuminate\Http\Response
     */
    public function show(DiaDanh $diaDanh, $id)
    {
        $data=DiaDanh::find($id);
        $DiaDanh=DiaDanh::join('vung_miens','dia_danhs.vung_miens_id','=','vung_miens.id')
        ->where('dia_danhs.id',$data['id'])
        ->select('dia_danhs.*','vung_miens.tenvungmien')->get();
        $hinhAnh=HinhAnh::join('dia_danhs','dia_danhs.id','=','hinh_anhs.dia_danhs_id')
        ->where('dia_danhs.id',$data['id'])
        ->select('dia_danhs.*','hinh_anhs.hinhanh')->get();
        foreach($hinhAnh as $ha)
        {
           $this->FixImg($ha); 
        }
        $NhuCau=NhuCau::join('diadanh_nhucaus','nhu_caus.id','=','diadanh_nhucaus.nhu_caus_id')
        ->where('diadanh_nhucaus.dia_danh_id',$data['id'])
        ->select('diadanh_nhucaus.*','nhu_caus.tennhucau')->get();
        return view('diadanh-detail',['diadanh'=>$diaDanh,'lstdiadanh'=>$DiaDanh,'lstHinhAnh'=>$hinhAnh,'lstNhuCau'=>$NhuCau]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @param  App\Models\DiaDanh $diaDanh
     * @return \Illuminate\Http\Response
     */
    public function edit(DiaDanh $diaDanh,$id)
    {
        $data=DiaDanh::find($id);
        $DiaDanh=DiaDanh::join('vung_miens','dia_danhs.vung_miens_id','=','vung_miens.id')
        ->where('dia_danhs.id',$data['id'])
        ->select('dia_danhs.*','vung_miens.tenvungmien')->get();
        return view('diadanh-edit',['diadanh'=>$diaDanh,'lstdiadanh'=>$DiaDanh]);
    }

    /**
     * Update the specified resource in storage.
     * @param  int  $id
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $input=$request->all();
        $diadanh=DiaDanh::find($id);

        $diadanh['tendiadanh']=$input['tendiadanh'];
        $diadanh['mota']=$input['mota'];
        $diadanh['kinhdo']=$input['kinhdo'];
        $diadanh['vido']=$input['vido'];
        $diadanh['vung_miens_id']=$input['vung_miens_id'];
        $diadanh->save();
        return Redirect::route('diadanh.index',['data'=>$diadanh]);
    }

    /**
     * Remove the specified resource from storage.
     * @param  int  $id
     * @param  App\Models\DiaDanh $diaDanh
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $diadanh=DiaDanh::find($id)->delete();
        return Redirect::route('diadanh.index');
    }
}