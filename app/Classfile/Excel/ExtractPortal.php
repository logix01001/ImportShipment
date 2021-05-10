<?php

namespace App\Classfile\Excel;
use XLSXWriter;
use App\Models\ImportDocument;
use App\Classfile\BOCDocuments;
use App\Classfile\Excel\ExcelFooter;
use App\Classfile\Excel\ExportExcel;
use App\Classfile\GetDateRange;

class ExtractPortal extends ExportExcel
{

    use TContainerFormattable;
    use GetDateRange;
    public $sheetname;
    public $dateheader;
    public $daterange = [];
    public $totalRows = 0;
    public $totalRowsFooter = 0;
    public $columnsize = [];


    /**
     * @param GeneratedExcel $xls - Type of document
     * @param Array $data - Data rows
     * @param Array $header - Header Rows
     * @param Array $dateheader - daterange
     * @param Array $columnsize - Size per column
     */

    public function __construct(GeneratedExcel $xls,$data,$header,$sheetname = "",$dateheader = [],$columnsize = [])
    {
        parent::__construct($xls,$data,$header);

        $this->sheetname = $sheetname;
        $this->dateheader = $dateheader;
        $this->columnsize = $columnsize;
        if(count($dateheader) > 0){
            $this->daterange = $this->getRange($dateheader,'Y-m-d');
        }

    }


    public function toExcel()
    {

        // $styles1 = array('font'=>'Arial','font-size'=>25,'height'=>30,'font-style'=>'bold', 'halign'=>'center', 'border'=>'left,right,top,bottom');

        //     if(count($datafiltered) == 0){
        //         continue;
        //     }

        $headers = $this->rowheader($this->header);
        $this->xls->xlsWriter->writeSheetHeader($this->sheetname,
        array('c1'=>'string','c2'=>'string','c3'=>'string','c4'=>'string'),
        $col_options = ['widths'=>  $this->columnsize, 'suppress_row' => 1] );
        $this->xls->xlsWriter->markMergedCell($this->sheetname, $start_row= 0, $start_col=9, $end_row=0, $end_col=10);
        $this->xls->xlsWriter->writeSheetRow($this->sheetname, $rowdata = $headers, $row_options = ['height'=>30,'border'=>"left,right,bottom,top",'halign'=>"center"] );


        $data = $this->bocextractdata($this->data,$this->header);
        //     //total containers


        foreach($data as $row)
        {
            $this->xls->xlsWriter->writeSheetRow($this->sheetname, $row,['border'=>"left,right,bottom,top",'halign'=>"center"] );

        }

        //     //$this->footer($datafiltered);
        //     //$this->totalRows += (2 + count($data) + 4);

        return $this->xls;


    }

    public function bocextractdata($datafiltered)
    {
        $data = [];
        $ctr = 0;
        foreach($datafiltered as $row)
        {

            foreach($this->header as $header=>$field){


                if(is_array($field)){

                    $data[$ctr][] = $this->checkzero($row[$field[0]],$row[$field[1]]);
                    $data[$ctr][] = $this->checkzero($row[$field[0]],$row[$field[1]],false);
                    continue;
                }
                if($field == 'shipment_priority'){
                    $data[$ctr][] = $row[$field] == 1 ? 'URGENT' : '';
                    continue;
                }
                $data[$ctr][] = $row[$field];
            }
            $ctr++;
        }

        return $data;
    }






}
