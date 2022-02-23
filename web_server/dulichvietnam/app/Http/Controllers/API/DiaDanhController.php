<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DiaDanh;
use App\Models\HinhAnhDiaDanh;
use App\Models\NhuCau;
use Illuminate\Support\Facades\Validator;

use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;


class DiaDanhController extends Controller
{
     public function FixImg(HinhAnhDiaDanh $hinhAnh)
    {
        if(Storage::disk('public')->exists($hinhAnh->hinhanh)){
            $hinhAnh->hinhanh=Storage::url($hinhAnh->hinhanh);
        }
        else{
            $hinhAnh->hinhanh='/admin_view/assets/images/No_Image.png';
        }
    }
    public function index(){
        // $diadanh = DiaDanh::orderBy('created_at','desc')->withCount('likes')->get();
        $lstdiadanh=DiaDanh::join('vung_miens','dia_danhs.vung_miens_id','=','vung_miens.id')
        ->select('dia_danhs.*','vung_miens.tenvungmien')->orderBy('created_at','desc')->withCount('likes')->withCount('views')->get();
        foreach($lstdiadanh as $diaDanh){
        foreach($diaDanh->hinhAnhs as $ha)
        {
           if(Storage::disk('public')->exists($ha->hinhanh)){
            $ha->hinhanh=Storage::url($ha->hinhanh);
        }
        else{
            $ha->hinhanh='/admin_view/assets/images/No_Image.png';
        } 
    }}
        
        $response =[
            'message'=>'Success',
            'data'=>$lstdiadanh,
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
        $input['tendiadanh']=$request->input('tendiadanh');
        $input['mota']=$request->input('mota');
        $input['kinhdo']=$request->input('kinhdo');
        $input['vido']=$request->input('vido');
        $input['trangthai']=$request->input('trangthai');
        $input['vung_miens_id']=$request->input('vung_miens_id');
        $validator = Validator::make($input, [
            'tendiadanh' => 'required|string|max:255',
            'mota' => 'required|string',
            'kinhdo' => 'required',
            'vido' => 'required',
            'vung_miens_id' => 'required'
        ]);
        if($validator->fails()){
            if(!empty($validator->errors()))
            $response['data']=$validator->errors();
            
            $response=[
                'message'=>'Validator Error',
            ]; 
            return response()->json($response,404);
        }
        $diadanh=DiaDanh::create($input);
        $inputImg['hinhanh']='';
        $inputImg['dia_danhs_id']=$diadanh['id'];
        $inputImg['trangthai']='1';
        if($request->hasFile('hinhanhs')){
            foreach($request->file('hinhanhs') as $key => $file)
            {
                $path = $file->store('admin_view/assets/images/diadanh/'.$diadanh['id'],'public');
                $inputImg['hinhanh']=$path;
                $hinhAnh=HinhAnhDiaDanh::create($inputImg);
            }
        }
        $response=[
                'message'=>'Success',
                'data'=>$diadanh
        ];
        return response()->json($response,200);
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function DaiDanhDetail(Request $request)
    {
        
        $diadanh=DiaDanh::join('vung_miens','dia_danhs.vung_miens_id','=','vung_miens.id')->where('dia_danhs.id',$id)
        ->select('dia_danhs.*','vung_miens.tenvungmien')->withCount('likes')->withCount('views')->get();
        $NhuCau=NhuCau::join('diadanh_nhucaus','nhu_caus.id','=','diadanh_nhucaus.nhu_caus_id')
        ->where('diadanh_nhucaus.dia_danh_id',$request->id)
        ->select('diadanh_nhucaus.*','nhu_caus.tennhucau')->get();
        if(is_null($diadanh))
        return $response['message']='Địa danh không tìm thấy';
        foreach($diadanh as $da ){
foreach($da->hinhAnhs as $ha)
        {
           $this->FixImg($ha); 
        }
        $da->vungMiens->tenvungmien;
        }
        
        $response=[
            'message'=>'Success',
            'data'=>$diadanh,
            'nhucau'=>$NhuCau,

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
    public function update(Request $request, $id)
    {
        $diadanh=DiaDanh::find($id);
        if(!$diadanh){
            return response()->json(['messgae'=>'Không tìm thấy địa danh nào !',403]);
        }
        $input=$request->all();

        $diadanh->tendiadanh=$input['tendiadanh'];
        $diadanh->mota=$input['mota'];
        $diadanh->kinhdo=$input['kinhdo'];
        $diadanh->vido=$input['vido'];
        $diadanh->vung_miens_id=$input['vung_miens_id'];
        $diadanh->save();

        $response =[
            'message'=>'Success',
            'data'=>$diadanh
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
        $diadanh=DiaDanh::find($id);
        if(!$diadanh){
            return response(['message'=>'Không tìm thấy địa danh']);
        }
        $lstdiadanh=DiaDanh::all();
        $diadanh->likes_diadanh()->delete();
        $diadanh->delete();
        $response=[
            'message'=>'Success',
            'data'=>$lstdiadanh
        ];
        return response()->json($response,200);
    }
}