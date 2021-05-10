<?php

namespace App\Classfile;

/**
 *  Trait to reuse the Array map
 */
trait ArrayMap
{

    /**
     * @param array $array - Array data
     * @param string $key - Key for mapping
     */
    public function map($array,$key)
    {

        return array_map(
                function($obj) use ($key) { return $obj[$key]; },
                $array
        );

    }
}
