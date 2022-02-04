<?php

namespace App\Http\Controllers;

use App\Models\VungMien;
use App\Models\DiaDanh;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;


class VungMienController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $lstVungMien=VungMien::all();
        $diadanh=DiaDanh::join('vung_miens','dia_danhs.vung_miens_id','=','vung_miens.id')
        ->select('dia_danhs.*','vung_miens.tenvungmien')->get();
        return view('diadanh-index',['data'=>$diadanh,'lstVungMien'=>$lstVungMien]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
        $validate=$request->validate([
            'tenvungmien'=>'required|max:255|string'
        ]);
        $vungmien=VungMien::create($input);
        return Redirect::route('diadanh.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\VungMien  $vungMien
     * @return \Illuminate\Http\Response
     */
    public function show(VungMien $vungMien)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\VungMien  $vungMien
     * @return \Illuminate\Http\Response
     */
    public function edit(VungMien $vungMien)
    {
        $vungmien=VungMien::all();
        return view('vungmien-edit',['vungmien'=>$vungMien,'lstvungmien'=>$vungmien]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @param  \App\Models\VungMien  $vungMien
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $input=$request->all();
        $vungmien=VungMien::find($id);
        $vungmien['tenvungmien']=$input['tenvungmien'];
        $vungmien['trangthai']=$input['trangthai'];
        $vungmien->save();
        return Redirect::route('diadanh.index',['lstVungMien'=>$vungmien]);
    }

    /**
     * Remove the specified resource from storage.
     * @param  int  $id
     * @param  \App\Models\VungMien  $vungMien
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $vungMien=VungMien::find($id)->delete();
        return Redirect::route('vungmien.index');
    }
}