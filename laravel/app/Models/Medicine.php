<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Medicine extends Model
{
    use HasFactory;

    protected $fillable = [
          'scientific_name',
          'trading_name',
          'manufacturer_company',
          'category_id',
      ];
     public function warehouses(){
        return $this->belongsToMany(Warehouse::class, 'warehouse_medicine', 'medicine_id', 'warehouse_id')
                    ->withPivot('price','quantity', 'expirydate');
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function orders(){
      return $this->belongsToMany(Warehouse::class, 'order_details', 'medicine_id', 'order_id')
                  ->withPivot('price','quantity', 'expirydate');

    }




}
