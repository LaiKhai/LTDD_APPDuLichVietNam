<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DiaDanh extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $table='dia_danhs';
    protected $fillable=[
        'tendiadanh',
        'mota',
        'kinhdo',
        'vido',
        'trangthai',
        'vung_miens_id'
    ];
    public function vungmien()
    {
        return $this->belongsTo(VungMien::class);
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
    public function hinhanh()
    {
        return $this->hasMany(HinhAnh::class);
    }
}