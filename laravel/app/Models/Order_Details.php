<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order_Details extends Model
{
    use HasFactory;
    protected $fillable = [
      'order_id',
      'medicine_id',
      'quantity',
      'price',
      'expiry date',
  ];



  
}
