<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\MonAn;
use App\Models\DiaDanh;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;
class MonAnController extends Controller
{
    public function fixImg(MonAn $monan){
        if(Storage::disk('public')->exists($monan->hinhanh)){
            $monan->hinhanh=Storage::url($monan->hinhanh);
        }
        else{
            $monan->hinhanh='/admin_view/assets/images/No_Image.png';
        }
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $monan = MonAn::all();
        $diadanh=MonAn::join('dia_danhs','mon_ans.dia_danhs_id','=','dia_danhs.id')
        ->select('mon_ans.*','dia_danhs.tendiadanh')->get();
        foreach($monan as $item){
            $this->fixImg($item);
        }
        return view('monan-index',[
            'MonAn' => $monan,
            'diaDanh'=>$diadanh
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $lstdiadanh=DiaDanh::all();
        return view('monan-add',['lstdiaDanh'=>$lstdiadanh]);
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
        $input['mota']=$request->input('mota');
        $input['dia_danhs_id']=$request->input('dia_danhs_id');
        $input['hinhanh']='';
        $input['trangthai']=$request->input('trangthai');
        $validator=$request->validate([
            'ten'=>'required|max:255|string',
            'mota'=>'required|string',
            'hinhanh'=>'required|image|file',
            'dia_danhs_id'=>'required'
        ]);
        $monan=MonAn::create($input);
        if($request->hasFile('hinhanh')){
            $monan['hinhanh']=$request->file('hinhanh')->store('admin_view/assets/images/monan/'.$monan['id'],'public');
        }
        $monan->save();
        return Redirect::route('monan.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @param  \App\Models\MonAn  $monan
     * @return \Illuminate\Http\Response
     */
    public function show(MonAn $monan)
    {
        $this->fixImg($monan);
        $diadanh=MonAn::join('dia_danhs','mon_ans.dia_danhs_id','=','dia_danhs.id')
        ->select('mon_ans.*','dia_danhs.tendiadanh')->get();
        return view('monan-detail',['monan'=>$monan,'diadanh'=>$diadanh]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\MonAn  $monan
     * @return \Illuminate\Http\Response
     */
    public function edit(MonAn  $monan)
    {
        $this->fixImg($monan);
        $diadanh=MonAn::join('dia_danhs','mon_ans.dia_danhs_id','=','dia_danhs.id')
        ->select('mon_ans.*','dia_danhs.tendiadanh')->get();
        $lstdiadanh=DiaDanh::all();
        return view('monan-edit',['monan'=>$monan,'lstdiadanh'=>$lstdiadanh,'diaDanh'=>$diadanh]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\MonAn  $monan
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, MonAn  $monan)
    {
        if($request->hasFile('hinhanh')){
            $monan->hinhanh=$request->file('hinhanh')->store('admin_view/assets/images/monan/'.$monan['id'],'public');
        }
        $monan->fill([
            'ten'=>$request->input('ten'),
            'mota'=>$request->input('mota'),
            'dia_danhs_id'=>$request->input('dia_danhs_id'),
            'trangthai'=>$request->input('trangthai')
        ]);
        $monan->save();
        return Redirect::route('monan.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\MonAn  $monan
     * @return \Illuminate\Http\Response
     */
    public function destroy(MonAn $monan)
    {
        $monan->delete();
         return Redirect::route('monan.index');
    }
}