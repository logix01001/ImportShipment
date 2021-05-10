<?php

namespace App\Classfile;

use App\Classfile\ImportDocument;
use App\Classfile\HasUpdatetableColumn;

/**
 *  Trait to reuse the Array map
 */
class ForwarderAdapter
{

    /**
     * @param string $class
     * @param string $column - column
     * @param string $document_code - Key for mapping
     * @param array $docsid - Key for mapping
     * @param string $value - value
     */


    protected $class;
    protected $column;
    protected $document_code;
    protected $docsid;
    protected $value;

    public function __construct($class,$column,$document_code,$docsid,$value)
    {
        $this->column = $column;
        $this->document_code = $document_code;
        $this->docsid = $docsid;
        $this->value = $value;
        $this->class = $class;

    }


    public function update()
    {
        if($this->column == 'forwarder')
        {
            if($this->value == '')
                $this->class::whereIn( $this->document_code, $this->docsid)->update(['credit_line' => null]);

            $this->class::whereIn( $this->document_code, $this->docsid)->update(['credit_line' => $this->value == 'NO FORWARDER' ? 'WITH CREDIT LINE' : 'NO CREDIT LINE']);
        }

    }

}
