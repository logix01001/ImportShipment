<?php

namespace App\Classfile;

use Illuminate\Support\Facades\DB;

/**
 *  Trait to reuse the Array map
 */
trait  HasNullableToString
{

    public function nullableValue($value)
    {
        return $value ?? '';
    }
}
