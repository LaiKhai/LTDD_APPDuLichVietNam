<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Likes_BaiViet extends Model
{
    use HasFactory;
    protected $fillable=[
        'users_id',
        'bai_viets_id'
    ];
}