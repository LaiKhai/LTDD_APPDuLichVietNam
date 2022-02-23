<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\DiaDanh;

class VungMien extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $table='vung_miens';
    protected $fillable=[
        'id',
        'tenvungmien',
        'trangthai'
    ];
    public function diaDanhs()
    {
        return $this->hasMany(DiaDanh::class,'vung_miens_id');
    }
}