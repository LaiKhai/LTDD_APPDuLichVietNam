<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Baiviet extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         Schema::create('bai_viets', function (Blueprint $table) {
            $table->id();
            $table->string('tieude');
            $table->string('mota');
            $table->enum('trangthai',[0,1,2]);
            $table->foreignId('dia_danhs_id');
            $table->foreignId('user_id');
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
        //
    }
}