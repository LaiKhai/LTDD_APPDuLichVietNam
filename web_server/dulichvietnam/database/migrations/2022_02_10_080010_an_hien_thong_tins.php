<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AnHienThongTins extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('an_hien_thong_tins', function (Blueprint $table) {
            $table->id();
            $table->foreignId('users_id');
            $table->enum('email',[0,1]);
            $table->enum('password',[0,1]);
            $table->enum('hoten',[0,1]);
            $table->enum('sdt',[0,1]);
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
        Schema::dropIfExists('an_hien_thong_tins');
    }
}