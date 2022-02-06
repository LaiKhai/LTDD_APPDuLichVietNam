<?php

namespace App\Http\Controllers;

use App\Models\LuuTru;
use App\Models\DiaDanh;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;

class LuuTruController extends Controller
{
    public function fixImg(LuuTru $luutru){
        if(Storage::disk('public')->exists($luutru->hinhanh))
        {
            $luutru->hinhanh=Storage::url($luutru->hinhanh);
        }
        else{
            $luutru->hinhanh='/admin_view/assets/images/No_Image.png';
        }
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $lstluutru=LuuTru::all();
        $diadanh=LuuTru::join('dia_danhs','luu_trus.dia_danhs_id','=','dia_danhs.id')
        ->select('luu_trus.*','dia_danhs.tendiadanh')->get();
        foreach($lstluutru as $lt){
            $this->fixImg($lt);
        }
        return view('luutru-index',['lstLuuTru'=>$lstluutru,'diaDanh'=>$diadanh]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $diadanh=DiaDanh::all();
        return view('luutru-add',['diaDanh'=>$diadanh]);
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
        $luutru=LuuTru::create($input);
        if($request->hasFile('hinhanh')){
            $luutru['hinhanh']=$request->file('hinhanh')->store('admin_view/assets/images/luutru/'.$luutru['id'],'public');
        }
        $luutru->save();
        return Redirect::route('luutru.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\LuuTru  $luutru
     * @return \Illuminate\Http\Response
     */
    public function show(LuuTru $luutru)
    {
        $this->fixImg($luutru);
         $diadanh=LuuTru::join('dia_danhs','luu_trus.dia_danhs_id','=','dia_danhs.id')
            ->select('luu_trus.*','dia_danhs.tendiadanh')->get();
        return view('luutru-detail',['luutru'=>$luutru,'diaDanh'=>$diadanh]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\LuuTru  $luutru
     * @return \Illuminate\Http\Response
     */
    public function edit(LuuTru $luutru)
    {
        $this->fixImg($luutru);
        $diadanh=LuuTru::join('dia_danhs','luu_trus.dia_danhs_id','=','dia_danhs.id')
            ->select('luu_trus.*','dia_danhs.tendiadanh')->get();
        $lstdiadanh=DiaDanh::all();
        return view('luutru-edit',['luutru'=>$luutru,'lstdiadanh'=>$lstdiadanh,'diaDanh'=>$diadanh]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\LuuTru  $luutru
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, LuuTru $luutru)
    {
         if($request->hasFile('hinhanh')){
            $luutru->hinhanh=$request->file('hinhanh')->store('admin_view/assets/images/monan/'.$luutru['id'],'public');
        }
        $luutru->fill([
            'ten'=>$request->input('ten'),
            'diachi'=>$request->input('diachi'),
            'sdt'=>$request->input('sdt'),
            'dia_danhs_id'=>$request->input('dia_danhs_id'),
            'trangthai'=>$request->input('trangthai')
        ]);
        $luutru->save();
        return Redirect::route('luutru.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\LuuTru  $luutru
     * @return \Illuminate\Http\Response
     */
    public function destroy(LuuTru $luutru)
    {
        $luutru->delete();
        return Redirect::route('luutru.index');
    }
}