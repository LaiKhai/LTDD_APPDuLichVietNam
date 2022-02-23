<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\DiaDanh_NhuCau;


class NhuCau extends Model
{
    use HasFactory;
    protected $table="nhu_caus";
    protected $fillable=[
        'id',
        'tennhucau',
        'hinhanh',
        'trangthai'
    ];
    public function diadanh_nhucau(){
        return $this->hasMany(DiaDanh_NhuCau::class);
    }
}