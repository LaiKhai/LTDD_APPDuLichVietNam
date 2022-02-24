<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\DiaDanh;
use Illuminate\Database\Eloquent\SoftDeletes;


class LuuTru extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $table='luu_trus';
    protected $fillable=[
        'ten',
        'diachi',
        'sdt',
        'hinhanh',
        'trangthai',
        'dia_danhs_id'
    ];
    public function diadanh(){
        return $this->belongsTo(DiaDanh::class,'dia_danhs_id');
    }
}