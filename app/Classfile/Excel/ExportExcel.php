<?php

namespace App\Classfile\Excel;

/**
 *  Trait to reuse the Array map
 */
abstract class ExportExcel
{

    use TContainerFormattable;
    public $data;
    public $header;
    public $xls;
    public function __construct(GeneratedExcel $xls,$data,$header)
    {
        $this->xls = $xls;
        $this->data = $data;
        $this->header = $header;
    }

    abstract public function toExcel();


}
