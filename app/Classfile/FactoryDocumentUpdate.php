<?php

namespace App\Classfile;

use App\Models\ImportDocument;
use App\Models\LodgementDetail;
use Illuminate\Http\Request;


class FactoryDocumentUpdate
{
    public $docsID;
    public $column;
    public $value;


    public function __construct(Request $request)
    {
        $this->docsId = $request->input('docsID');
        $this->column = $request->input('column');
        $this->value = $request->input('value');

        if($this->column == 'is_received'){
            $this->column = 'is_document_received_processing';
        }

    }

    public function update()
    {

        if(in_array($this->column,ImportDocument::getColumnLists()))
        {
            return  ImportDocument::updateColumn( $this->docsId,$this->column,$this->value);

        }elseif(in_array($this->column,LodgementDetail::getColumnLists()))
        {
            return LodgementDetail::updateColumn( $this->docsId,$this->column,$this->value,'document_code_fk');
        }

    }



}
