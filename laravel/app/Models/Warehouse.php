<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Warehouse extends Model
{
    use HasFactory;
    protected $fillable = [
      'name',
      'user_id'
  ];

    public function medicines(){
        return $this->belongsToMany(Medicine::class, 'warehouse_medicines', 'warehouse_id', 'medicine_id')
                    ->withPivot('price','quantity', 'expirydate');
    }
}
