<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'warehouse_id',
        'status',
        'paid',
        'total',
        'estimated_date'
    ];
    public function ordered_medicines(){
    return $this->belongsToMany(Medicine::class, 'order__details', 'order_id', 'medicine_id')
                ->withPivot('price','quantity', 'expirydate');
    }
}
