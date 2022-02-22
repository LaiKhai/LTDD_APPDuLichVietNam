<?php

namespace App\Http\Controllers;

use App\Models\NhuCau;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;

class NhuCauController extends Controller
{
     public function fixImg(NhuCau $nhucau){
        if(Storage::disk('public')->exists($nhucau->hinhanh)){
            $nhucau->hinhanh=Storage::url($nhucau->hinhanh);
        }
        else{
            $nhucau->hinhanh='/admin_view/assets/images/No_Image.png';
        }
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data=NhuCau::all();
        foreach($data as $item){
            $this->fixImg($item);
        }
        return view('nhucau-index',['lstnhucau'=>$data]);
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
        $input['tennhucau']=$request->input('tennhucau');
        $input['hinhanh']='';
        $input['trangthai']=$request->input('trangthai');
        $validator=$request->validate([
            'tennhucau'=>'required|max:255|string',
            'hinhanh'=>'required|image|file'
        ]);
        $nhucau=NhuCau::create($input);
        if($request->hasFile('hinhanh')){
            $nhucau['hinhanh']=$request->file('hinhanh')->store('admin_view/assets/images/nhucau/'.$nhucau['id'],'public');
        }
        $nhucau->save();
        return Redirect::route('nhucau.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\NhuCau  $nhuCau
     * @return \Illuminate\Http\Response
     */
    public function show(NhuCau $nhuCau)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\NhuCau  $nhuCau
     * @return \Illuminate\Http\Response
     */
    public function edit(NhuCau $nhuCau)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\NhuCau  $nhuCau
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, NhuCau $nhuCau)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\NhuCau  $nhucau
     * @return \Illuminate\Http\Response
     */
    public function destroy(NhuCau $nhucau)
    {
        $nhucau->delete();
        return Redirect::route('nhucau.index');
    }
}