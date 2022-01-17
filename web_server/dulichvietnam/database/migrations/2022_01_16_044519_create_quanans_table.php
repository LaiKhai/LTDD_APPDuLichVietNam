<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateQuanansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('quan_ans', function (Blueprint $table) {
            $table->id();
            $table->string('ten',50);
            $table->string('diachi',50);
            $table->string('sdt')->nullable();
            $table->string('hinhanh')->nullable();
            $table->enum('trangthai',[0,1,2]);
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
        Schema::dropIfExists('quan_ans');
    }
}
