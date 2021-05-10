<?php

namespace App\Classfile\Excel;
use XLSXWriter;
/**
 *  Trait to reuse the Array map
 */
class GeneratedExcel
{
    public $xlsWriter;

    public function __construct()
    {
        $this->xlsWriter =  new XLSXWriter();
    }

    public function getXls()
    {
        return $this->xlsWriter;
    }
}
