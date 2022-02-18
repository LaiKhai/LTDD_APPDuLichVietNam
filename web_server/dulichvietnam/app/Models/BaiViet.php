<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\DiaDanh;
use App\Models\Likes_BaiViet;

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
    public function likes_baiviet(){
        return $this->hasMany(Likes_BaiViet::class);
    }
}