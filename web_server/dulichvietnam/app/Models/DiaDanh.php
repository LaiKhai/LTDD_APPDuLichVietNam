<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DiaDanh extends Model
{
    use HasFactory;
    protected $fillable=[
        'tendiadanh',
        'mota',
        'kinhdo',
        'vido',
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
}