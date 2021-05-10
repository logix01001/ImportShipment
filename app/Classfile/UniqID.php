<?php

namespace App\Classfile;

/**
 *  Trait to reuse the Array map
 */
abstract class UniqID
{

    public $id;
    public $prefix;
    public $suffix;


    abstract public function generate();
}
