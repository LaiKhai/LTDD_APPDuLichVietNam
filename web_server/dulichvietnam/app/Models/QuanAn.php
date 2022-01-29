<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\SoftDeletes;
class QuanAn extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable=[
        'ten',
        'diachi',
        'sdt',
        'hinhanh',
        'trangthai'
    ];
    public function diadanh(){
        return $this->belongsTo(DiaDanh::class);
    }
}