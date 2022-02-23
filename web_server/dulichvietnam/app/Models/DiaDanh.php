<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\VungMien;
use App\Models\MonAn;
use App\Models\QuanAn;
use App\Models\LuuTru;
use App\Models\BaiViet;
use App\Models\HinhAnhDiaDanh;
use App\Models\Likes_DiaDanh;
use App\Models\DiaDanh_NhuCau;

class DiaDanh extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $table='dia_danhs';
    protected $fillable=[
        'id',
        'tendiadanh',
        'mota',
        'kinhdo',
        'vido',
        'trangthai',
        'vung_miens_id'
    ];
    public function vungMiens()
    {
        return $this->belongsTo(VungMien::class,'vung_miens_id');
    }
    public function monan()
    {
        return $this->hasMany(MonAn::class);
    }
    public function quanan()
    {
        return $this->hasMany(QuanAn::class);
    }
    public function luutru()
    {
        return $this->hasMany(LuuTru::class);
    }
    public function baiviet()
    {
        return $this->hasMany(BaiViet::class);
    }
    public function hinhAnhs()
    {
        return $this->hasMany(HinhAnhDiaDanh::class,'dia_danhs_id');
    }
    public function likes()
    {
        return $this->hasMany(Likes_DiaDanh::class);
    }
    public function views()
    {
        return $this->hasMany(LuotXem_DiaDanh::class);
    }
    public function diadanh_nhucau(){
        return $this->hasMany(DiaDanh_NhuCau::class);
    }
}