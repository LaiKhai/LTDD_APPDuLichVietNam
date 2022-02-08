<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MonAn extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table='mon_ans';
    protected $fillable=[
        'id',
        'ten',
        'mota',
        'hinhanh',
        'dia_danhs_id',
        'trangthai'
    ];
    public function diadanh(){
        return $this->belongsTo(DiaDanh::class);
    }
}