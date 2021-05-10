<?php

namespace App\Classfile\Excel;
use XLSXWriter;
use App\Models\ImportDocument;
use App\Classfile\BOCDocuments;
use App\Classfile\Excel\ExcelFooter;
use App\Classfile\Excel\ExportExcel;
use App\Classfile\GetDateRange;

class ReceivingCopy extends ExportExcel implements ExcelFooter
{
    use TContainerFormattable;
    use GetDateRange;
    public $sheetname;
    public $dateheader;
    public $daterange = [];
    public $totalRows = 0;
    public $totalRowsFooter = 0;

    public function __construct(GeneratedExcel $xls,$data,$header,$sheetname = "",$dateheader = [])
    {
        parent::__construct($xls,$data,$header);

        $this->sheetname = $sheetname;
        $this->dateheader = $dateheader;
        $this->daterange = $this->getRange($dateheader,'Y-m-d');
    }

    public function convertDateHeader(){
        $headers = [];
        foreach($this->dateheader as $header)
        {
            $headers[] = date("d-M-y", strtotime($header));
        }

        return implode("-",$headers);
    }
    public function toExcel()
    {

        $styles1 = array('font'=>'Arial','font-size'=>25,'height'=>30,'font-style'=>'bold', 'halign'=>'center', 'border'=>'left,right,top,bottom');


        foreach( $this->daterange as $dateheader)
        {

            unset($currentfactory);
            $datafiltered = $this->data->filter(function ($value, $key) use($dateheader) {
                return $value['turnover_process_date'] == $dateheader;
            });
            if(count($datafiltered) == 0){
                continue;
            }




            if(str_contains(strtoupper($this->sheetname),"SOUTH")){

                $this->xls->xlsWriter->writeSheetHeader($this->sheetname,
                array('c1'=>'string','c2'=>'string','c3'=>'string','c4'=>'string'),
                $col_options = ['widths'=>[10,30,30,20,10,10,20], 'suppress_row' => 1] );
                $this->xls->xlsWriter->writeSheetRow($this->sheetname, $rowdata = array("SUMMARY FOR BOC PROCESSING - SOUTH","","","","","","",date("d-M-y", strtotime($dateheader))), $row_options = ['height'=>20,'border'=>"left,right,bottom,top","halign"=>"center"] );
                $this->xls->xlsWriter->markMergedCell($this->sheetname, $start_row= ($this->totalRows + 1), $start_col=4, $end_row=($this->totalRows + 1), $end_col=5);
                $this->xls->xlsWriter->markMergedCell($this->sheetname, $start_row= $this->totalRows, $start_col=0, $end_row=$this->totalRows, $end_col=6);
            }
            else
            {
                $this->xls->xlsWriter->writeSheetHeader($this->sheetname,
                array('c1'=>'string','c2'=>'string','c3'=>'string','c4'=>'string'),
                $col_options = ['widths'=>[10,30,30,20,10,10,20], 'suppress_row' => 1] );
                $this->xls->xlsWriter->writeSheetRow($this->sheetname, $rowdata = array("SUMMARY FOR BOC PROCESSING - NORTH","","","","","","",date("d-M-y", strtotime($dateheader))), $row_options = ['height'=>20,'border'=>'left,right,bottom,top',"halign"=>"center"] );

                $this->xls->xlsWriter->markMergedCell($this->sheetname, $start_row= ($this->totalRows + 1), $start_col=4, $end_row=($this->totalRows + 1), $end_col=5);
                $this->xls->xlsWriter->markMergedCell($this->sheetname, $start_row= $this->totalRows, $start_col=0, $end_row=$this->totalRows, $end_col=6);
            }




            $headers = $this->rowheader($this->header);

            $this->xls->xlsWriter->writeSheetRow($this->sheetname, $rowdata = $headers, $row_options = ['height'=>20,'border'=>"left,right,bottom,top","halign"=>"center"] );


            $data = $this->bocreceivingcopydata($datafiltered,$this->header);
            //total containers


            foreach($data as $row)
            {
                if(!isset( $currentfactory)){
                    $currentfactory = $row[2];
                    $tcontainers = 0;
                }

                if($currentfactory != $row[2]){
                    $this->xls->xlsWriter->writeSheetRow($this->sheetname, $rowdata = array( "","","","", $tcontainers), [['height'=>25],"","","",['fill'=>'#FFFF00','border'=>"left,right,bottom,top",'halign'=>'center',"halign"=>"center"]]);
                    $this->totalRows += 1;
                    $currentfactory = $row[2];
                    $tcontainers = 0;
                    $tcontainers += (array_sum(explode(",",$row[4])));

                }else{
                   // $this->xls->xlsWriter->writeSheetRow($this->sheetname, $rowdata = array( $currentfactory, $row[2],"","", $tcontainers), [['height'=>25],"","","",['fill'=>'#FFFF00','border'=>"left,right,bottom,top",'halign'=>'center']]);
                    $tcontainers += (array_sum(explode(",",$row[4])));


                }
                $this->xls->xlsWriter->writeSheetRow($this->sheetname, $row, ['border'=>"left,right,bottom,top","halign"=>"center"]  );

                if( !next( $row ) )
                {
                    $this->xls->xlsWriter->writeSheetRow($this->sheetname, $rowdata = array( "","","","",$tcontainers),[ 'height'=>20,[],[],[],[],['fill'=>'#c0c0c0','border'=>"left,right,bottom,top",'halign'=>'center','font-size'=>13]] );
                    $tcontainers = 0;
                }



            }


            $this->xls->xlsWriter->writeSheetRow($this->sheetname, $rowdata = array( "","","","", $tcontainers), [['height'=>25],"","","",['fill'=>'#FFFF00','border'=>"left,right,bottom,top",'halign'=>'center']]);
            $this->xls->xlsWriter->writeSheetRow($this->sheetname, $rowdata = array( "","","",""), $row_options = ['height'=>10] );
            //$this->footer($datafiltered);
            $this->totalRows += (2 + count($data) + 2 );

        }



        return $this->xls;


    }

    public function bocreceivingcopydata($datafiltered)
    {

        $data = [];
        $ctr = 0;
        foreach($datafiltered->toArray() as $row)
        {

            foreach($this->header as $header=>$field){
                if(is_array($field)){

                    $data[$ctr][] = $this->checkzero($row[$field[0]],$row[$field[1]]);
                    $data[$ctr][] = $this->checkzero($row[$field[0]],$row[$field[1]],false);
                    continue;
                }
                $data[$ctr][] = $row[$field];
            }
            $ctr++;
        }

        return $data;
    }

    public function footer($data)
    {
        $tcontainers = array_sum(array_column($data->toArray(),"size_20"));
        $tcontainers += array_sum(array_column($data->toArray(),"size_40"));

        $this->xls->xlsWriter->writeSheetRow($this->sheetname, [] );
        $this->xls->xlsWriter->writeSheetRow($this->sheetname, [] );

        $sum = array_sum(array_column($data->toArray(),"total_amount"));


        $mergeContainerTotal = ((2+$this->totalRows)  + count($data) + 2);

        if(str_contains(strtoupper($this->sheetname),"SOUTH")){
            $this->xls->xlsWriter->writeSheetRow($this->sheetname, [count($data),"","","","","{$tcontainers} CONTAINERS","","",$sum] );
            $this->xls->xlsWriter->markMergedCell($this->sheetname, $start_row= $mergeContainerTotal, $start_col=5, $end_row= $mergeContainerTotal, $end_col=7);

        }else
        { $this->xls->xlsWriter->writeSheetRow($this->sheetname, [count($data),"","","","{$tcontainers} CONTAINERS","","",$sum] );
            $this->xls->xlsWriter->markMergedCell($this->sheetname, $start_row= $mergeContainerTotal, $start_col=4, $end_row= $mergeContainerTotal, $end_col=6);
        }

        $this->xls->xlsWriter->writeSheetRow($this->sheetname, [] );
        $this->xls->xlsWriter->writeSheetRow($this->sheetname, [] );

    }
}
