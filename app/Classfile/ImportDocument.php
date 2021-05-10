<?php

namespace App\Classfile;


abstract class ImportDocument
{
    public $selectedField = [];

    public function __invoke()
    {
        return (Array) $this->selectedField;
    }
}
