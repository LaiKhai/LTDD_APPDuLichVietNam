<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LuotXem_DiaDanh extends Model
{
    use HasFactory;
    protected $table="luot_xems_dia_danhs";
    protected $fillable=[
        'users_id',
        'dia_danh_id'
    ];
}