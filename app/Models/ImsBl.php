<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImsBl extends Model
{
    use HasFactory;
    protected $connection = 'imsconnection';
    protected $table = 'bill_of_ladings';


    public function documents()
    {
        return $this->hasOne(ImportDocument::class,'bl_number','bl_no');
    }
}


