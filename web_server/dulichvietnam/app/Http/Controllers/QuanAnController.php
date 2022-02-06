<?php

namespace App\Http\Controllers;

use App\Models\QuanAn;
use App\Models\DiaDanh;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;

class QuanAnController extends Controller
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
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $lstQuanAn=QuanAn::all();
        $diadanh=QuanAn::join('dia_danhs','quan_ans.dia_danhs_id','=','dia_danhs.id')
        ->select('quan_ans.*','dia_danhs.tendiadanh')->get();
        foreach($lstQuanAn as $qa){
            $this->fixImg($qa);
        }
        return view('quanan-index',['lstquanan'=>$lstQuanAn,'diaDanh'=>$diadanh]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $diadanh=DiaDanh::all();
        return view('quanan-add',['diaDanh'=>$diadanh]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input['ten']=$request->input('ten');
        $input['diachi']=$request->input('diachi');
        $input['sdt']=$request->input('sdt');
        $input['dia_danhs_id']=$request->input('dia_danhs_id');
        $input['hinhanh']='';
        $input['trangthai']=$request->input('trangthai');
        $validator=$request->validate([
            'ten'=>'required|max:255|string',
            'sdt'=>'required|max:11',
            'diachi'=>'required|string',
            'hinhanh'=>'required|image|file',
            'dia_danhs_id'=>'required'
        ]);
        $quanAn=QuanAn::create($input);
        if($request->hasFile('hinhanh')){
            $quanAn['hinhanh']=$request->file('hinhanh')->store('admin_view/assets/images/luutru/'.$quanAn['id'],'public');
        }
        $quanAn->save();
        return Redirect::route('quanan.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\QuanAn  $quanan
     * @return \Illuminate\Http\Response
     */
    public function show(QuanAn $quanan)
    {
        $this->fixImg($quanan);
        $diadanh=QuanAn::join('dia_danhs','quan_ans.dia_danhs_id','=','dia_danhs.id')
        ->select('quan_ans.*','dia_danhs.tendiadanh')->get();
        return view('quanan-detail',['quanan'=>$quanan,'diaDanh'=>$diadanh]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\QuanAn  $quanan
     * @return \Illuminate\Http\Response
     */
    public function edit(QuanAn $quanan)
    {
        $this->fixImg($quanan);
        $diadanh=QuanAn::join('dia_danhs','quan_ans.dia_danhs_id','=','dia_danhs.id')
            ->select('quan_ans.*','dia_danhs.tendiadanh')->get();
        $lstdiadanh=DiaDanh::all();
        return view('quanan-edit',['quanan'=>$quanan,'lstdiadanh'=>$lstdiadanh,'diaDanh'=>$diadanh]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\QuanAn  $quanan
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, QuanAn $quanan)
    {
        if($request->hasFile('hinhanh')){
            $quanan->hinhanh=$request->file('hinhanh')->store('admin_view/assets/images/monan/'.$quanan['id'],'public');
        }
        $quanan->fill([
            'ten'=>$request->input('ten'),
            'diachi'=>$request->input('diachi'),
            'sdt'=>$request->input('sdt'),
            'dia_danhs_id'=>$request->input('dia_danhs_id'),
            'trangthai'=>$request->input('trangthai')
        ]);
        $quanan->save();
        return Redirect::route('quanan.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\QuanAn  $quanan
     * @return \Illuminate\Http\Response
     */
    public function destroy(QuanAn $quanan)
    {
         $quanan->delete();
        return Redirect::route('quanan.index');
    }
}