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
                    ->withPivot('price','quantity', 'expiry_date');
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}
