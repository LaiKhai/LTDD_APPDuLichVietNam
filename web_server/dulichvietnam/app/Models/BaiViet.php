<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BaiViet extends Model
{
    use HasFactory;
    protected $fillable=[
        'tieude',
        'mota',
        'trangthai',
        'dia_danhs_id',
        'user_id'
    ];
    
    public function diadanh()
    {
        return $this->belongsTo(DiaDanh::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}