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
      Schema::create('warehouse_medicines', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('medicine_id');
        $table->unsignedBigInteger('warehouse_id');
        $table->double('price');
        $table->integer('quantity');
        $table->date('expirydate');
        $table->timestamps();
        $table->foreign('medicine_id')->references('id')->on('medicines');
        $table->foreign('warehouse_id')->references('id')->on('warehouses');
    });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('warehouse__medicines');
    }
};
