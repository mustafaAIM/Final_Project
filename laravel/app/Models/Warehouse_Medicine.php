<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Warehouse_Medicine extends Model
{
    use HasFactory;
    protected $fillable = [
      'medicine_id',
      'warehouse_id',
      'price',
      'quantity',
      'expirydate',
  ];
}
