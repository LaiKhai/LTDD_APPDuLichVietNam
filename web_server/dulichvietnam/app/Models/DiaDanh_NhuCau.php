<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\DiaDanh;
use App\Models\NhuCau;


class DiaDanh_NhuCau extends Model
{
    use HasFactory;
    protected $table="diadanh_nhucaus";
    protected $fillable=[
        'dia_danh_id',
        'nhu_caus_id'
    ];
    public function nhucau()
    {
        return $this->belongsTo(NhuCau::class);
    }
    public function diadanh()
    {
        return $this->belongsTo(DiaDanh::class);
    }
}