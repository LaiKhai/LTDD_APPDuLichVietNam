<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateForeignKey extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('dia_danhs', function (Blueprint $table) {
            $table->foreign('vung_miens_id')->references('id')->on('vung_miens');
        });
        Schema::table('luu_trus', function (Blueprint $table) {
            $table->foreign('dia_danhs_id')->references('id')->on('dia_danhs');
        });
        Schema::table('quan_ans', function (Blueprint $table) {
            $table->foreign('dia_danhs_id')->references('id')->on('dia_danhs');
        });
        Schema::table('mon_ans', function (Blueprint $table) {
            $table->foreign('dia_danhs_id')->references('id')->on('dia_danhs');
        });
        Schema::table('bai_viets', function (Blueprint $table) {
            $table->foreign('dia_danhs_id')->references('id')->on('dia_danhs');
            $table->foreign('user_id')->references('id')->on('users');
        });
        Schema::table('diadanh_nhucaus', function (Blueprint $table) {
            $table->foreign('dia_danhs_id')->references('id')->on('dia_danhs');
            $table->foreign('nhu_caus_id')->references('id')->on('nhu_caus');
        });
        Schema::table('hinh_anhs', function (Blueprint $table) {
            $table->foreign('dia_danhs_id')->references('id')->on('dia_danhs');
            $table->foreign('bai_viets_id')->references('id')->on('bai_viets');
        });
        Schema::table('luot_xems', function (Blueprint $table) {
            $table->foreign('users_id')->references('id')->on('users');
            $table->foreign('bai_viets_id')->references('id')->on('bai_viets');
        });
        Schema::table('luot_likes', function (Blueprint $table) {
            $table->foreign('users_id')->references('id')->on('users');
            $table->foreign('bai_viets_id')->references('id')->on('bai_viets');
        });
        Schema::table('an_hien_thong_tins', function (Blueprint $table) {
            $table->foreign('users_id')->references('id')->on('users');
        });
        Schema::table('vi_phams', function (Blueprint $table) {
            $table->foreign('users_id')->references('id')->on('users');
            $table->foreign('bai_viets_id')->references('id')->on('bai_viets');
            $table->foreign('loai_vi_phams_id')->references('id')->on('loai_vi_phams');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('dia_danhs', function (Blueprint $table) {
            $table->dropForeign(['vung_miens_id']);
            $table->dropColumn('vung_miens_id');
        });
        Schema::table('luu_trus', function (Blueprint $table) {
            $table->dropForeign(['dia_danhs_id']);
            $table->dropColumn('dia_danhs_id');
        });
        Schema::table('quan_ans', function (Blueprint $table) {
            $table->dropForeign(['dia_danhs_id']);
            $table->dropColumn('dia_danhs_id');
        });
        Schema::table('mon_ans', function (Blueprint $table) {
            $table->dropForeign(['dia_danhs_id']);
            $table->dropColumn('dia_danhs_id');
        });
    }
}