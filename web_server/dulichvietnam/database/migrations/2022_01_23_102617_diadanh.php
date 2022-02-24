<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Diadanh extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dia_danhs', function (Blueprint $table) {
            $table->id();
            $table->string('tendiadanh');
            $table->longText('mota');
            $table->string('kinhdo')->nullable();
            $table->string('vido')->nullable();
            $table->foreignId('vung_miens_id');
            $table->integer('trangthai');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('dia_danhs');
    }
}