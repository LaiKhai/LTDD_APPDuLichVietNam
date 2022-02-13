<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class HinhAnh extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $table='hinh_anhs';
    protected $fillable=[
        'hinhanh',
        'trangthai',
        'bai_viets_id',
        'dia_danhs_id'
    ];
    public function diadanh()
    {
        return $this->belongsTo(DiaDanh::class);
    }
}