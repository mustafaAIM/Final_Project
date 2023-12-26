<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
      Schema::create('order__details', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('order_id');
        $table->unsignedBigInteger('medicine_id');
        $table->integer('quantity');
        $table->double('price');
        $table->date('expirydate');
        $table->timestamps();
        $table->foreign('order_id')->references('id')->on('orders');
        $table->foreign('medicine_id')->references('id')->on('medicines');
    });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order__details');
    }
};
