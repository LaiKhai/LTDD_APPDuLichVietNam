<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class HinhAnhDiaDanh extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $table='hinh_anh_dia_danhs';
    protected $fillable=[
        'hinhanh',
        'trangthai',
        'dia_danhs_id'
    ];
    public function diadanh()
    {
        return $this->belongsTo(DiaDanh::class);
    }
}