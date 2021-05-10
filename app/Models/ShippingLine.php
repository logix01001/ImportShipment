<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShippingLine extends Model
{
    use HasFactory;
    protected $fillable = ['shipping_company_code','shipping_company_name','invoice_mk'];
}
