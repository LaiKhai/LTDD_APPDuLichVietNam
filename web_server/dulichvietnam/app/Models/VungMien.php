<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VungMien extends Model
{
    use HasFactory;
    
    public function diadanh()
    {
        return $this->hasMany(DiaDanh::class);
    }
}