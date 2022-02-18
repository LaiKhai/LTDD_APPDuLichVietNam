<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Likes_DiaDanh extends Model
{
    use HasFactory;
    protected $table='luot_likes_dia_danhs';
    protected $fillable=[
        'users_id',
        'dia_danh_id'
    ];
}