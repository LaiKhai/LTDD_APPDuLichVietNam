<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class LuotLikesDiaDanh extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('luot_likes_dia_danhs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('users_id');
            $table->foreignId('dia_danh_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
         Schema::dropIfExists('luot_likes_dia_danhs');
    }
}