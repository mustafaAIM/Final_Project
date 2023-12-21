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
      Schema::create('orders', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('user_id');
        $table->unsignedBigInteger('warehouse_id');
        $table->string('status');
        $table->boolean('paid');
        $table->date('creation date');
        $table->date('estimated date');
        $table->timestamps();
        $table->foreign('user_id')->references('id')->on('users');
        $table->foreign('warehouse_id')->references('id')->on('warehouses');
    });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
