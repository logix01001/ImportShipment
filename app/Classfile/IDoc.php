<?php

namespace App\Classfile;

use App\Classfile\UniqID;
use App\Models\ImportDocument;

/**
 *  Trait to reuse the Array map
 */
class IDoc extends UniqID
{

    public function __construct()
    {
        $this->prefix = 'IDOC' . date('Y') . '_';
        $this->suffix = $this->_getLastId();
    }
    public function generate()
    {
        return $this->prefix . $this->suffix;
    }

    private function _getLastId()
    {

        $lastId = ImportDocument::lastDoc();

        if($lastId == null){
            return 1;
        }

        $latestid = intVal(explode('_',$lastId->document_code)[1]);
        $latestid++;
        return  $latestid;
    }
}
