<?php

namespace App\Http\Controllers;

use XLSXWriter;
use Illuminate\Http\Request;
use App\Models\ImportDocument;
use App\Classfile\BOCDocuments;
use App\Classfile\Excel\BOCSummary;
use App\Classfile\BOCExtractDocuments;
use App\Classfile\Excel\ExtractPortal;
use App\Classfile\Excel\ReceivingCopy;
use App\Classfile\Excel\GeneratedExcel;
use App\Classfile\EndorseExtractDocuments;
use App\Classfile\GenerateExcel;

class BOCExcel extends Controller
{
    //

    use GenerateExcel;
    protected $summarySouth = [
        "TSAD"=>"tsad_number",
        "OP NUMBER" => "op_number",
        "BL NUMBER" => "bl_number",
        "FACTORY" => "factory_name",
        "POD" => "pod",
        "NO. OF CONTAINERS" => ["size_20","size_40"],
        "CEZ NUMBER" => "ip_number",
        "AMOUNT" => "total_amount",
        ];

    protected $bocextractportal = [
            "RECEIVED DOCS"=>"document_received_date",
            "COMMODITY" => "commodity",
            "SHIPPING LINE" => "shipping_company_name",
            "VESSEL" => "connecting_vessel",
            "CONTAINER NO" => "container_number",
            "PORT" => "pod",
            "PORT" => "pod",
            "BL NUMBER" => "bl_number",
            "FACTORY" => "factory_abbr",
            "POD" => "pod",
            "NO. OF CONTAINERS" => ["size_20","size_40"],
            "TURN OVER DATE" => "turnover_process_date",
            "ETA" => "estimated_time_arrival",
            "ATA" => "actual_time_arrival",
            "ATB" => "actual_berthing_date",
            "ATD" => "actual_discharge",
            "IP" => "ip_date",
            "E2M" => "e2m_date",
            "IP APRV" => "ip_approval_date",
            "E2M APRV" => "e2m_approval_date",
            "BIL REC" => "billing_received_date",
            "BIL PAY" => "coordinator_payment_date",
            "TGT GTPS" => "target_gatepass",
            "ACT GTPS" => "actual_gatepass",
            "PRIORITY" => "shipment_priority",
        ];
    protected $endorsementExtract = [
            "BL NUMBER" => "bl_number",
            "CONSIGNEE" => "factory_abbr",
            "FORWARDER"=>"forwarder",
            "SHIPPING LINE" => "shipping_company_name",
            "PRIORITY" => "shipment_priority",
            "LATEST ETA" => "latest_estimated_time_arrival",
            "PORT" => "pod",
            "REGISTRY NO" => "registry_no",
            "VESSEL" => "connecting_vessel",
        ];

    protected $targetlodgementExtract = [
            "BL NUMBER" => "bl_number",
            "CONSIGNEE" => "factory_abbr",
            "DATE RECEIVED MC" => "document_received_date",
            "LATEST ETA" => "latest_estimated_time_arrival",
            "TURNOVER DATE" => "turnover_process_date",
            "IP DATE" => "ip_date",
            "PRIORITY" => "shipment_priority",
    ];
    protected $ReceivingCopy = [
        "TSAD"=>"tsad_number",
        "BL NUMBER" => "bl_number",
        "FACTORY" => "factory_abbr",
        "POD" => "pod",
        "NO. OF CONTAINERS" => ["size_20","size_40"],
        "ETA" => "estimated_time_arrival",
        "REMARKS" => "remarks_tag",
    ];
    protected $summaryNorth = [
            "TSAD"=>"tsad_number",
            "BL NUMBER" => "bl_number",
            "FACTORY" => "factory_name",
            "POD" => "pod",
            "NO. OF CONTAINERS" => ["size_20","size_40"],
            "CEZ NUMBER" => "ip_number",
            "AMOUNT" => "total_amount",
            ];


    public function summary($datefrom, $dateto)
    {



            // $writer = new XLSXWriter();
            // $writer->writeSheetHeader('Sheet1', $rowdata = array("this is a test",234,456,789), $col_options = ['widths'=>[10,20,30,40]] );
            // $writer->writeSheetRow('Sheet1', $rowdata = array("this is a test",234,456,789), $row_options = ['height'=>20] );
            // $writer->writeSheetRow('Sheet1', $rowdata = array("this is a test",234,456,789), $row_options = ['height'=>30] );
            // $writer->writeSheetRow('Sheet1', $rowdata = array("this is a test",234,456,789), $row_options = ['height'=>40] );
            // $writer->writeToFile($file);
            $dateRange =  [$datefrom,$dateto];

            // $arrivalDocs = ['ARRIVAL UPDATE','COORDINATOR','CRO MONITORING'];
            // $lodgeDocs = ['LODGEMENT','LEADER LODGEMENT'];


            $docs = new BOCDocuments;

            if(empty($dateRange)){
                $dateRange = [];
            }

            $documents = new ImportDocument;
            $documents = $documents->setDocumentBoc($docs,$dateRange,'turnover_process_date');


            $data = $documents->get();
            $south = $data->filter(function ($value, $key) {
                return $value['pod'] == "SOUTH";
            });
            $north = $data->filter(function ($value, $key) {
                return $value['pod'] == "NORTH";
            });

            $BOCExcel = new GeneratedExcel;

            $BOC = new BOCSummary($BOCExcel,$south,$this->summarySouth,"Summary for SOUTH",$dateRange);
            $BOCExcel = $BOC->toExcel();
            $BOC = new BOCSummary($BOCExcel,$north,$this->summaryNorth,"Summary for NORTH",$dateRange);
            $BOCExcel = $BOC->toExcel();// $styles1 = array('font'=>'Arial','font-size'=>25,'height'=>30,'font-style'=>'bold', 'halign'=>'center', 'border'=>'left,right,top,bottom');


            $this->toExcel($BOCExcel,"summary_" . implode('_',$dateRange) . '.xls');




    }

    public function receivingcopy($datefrom, $dateto)
    {
        $dateRange =  [$datefrom,$dateto];

        $docs = new BOCDocuments;

        if(empty($dateRange)){
            $dateRange = [];
        }

        $documents = new ImportDocument;
        $documents = $documents->setDocumentBoc($docs,$dateRange,'turnover_process_date');


        $data = $documents->get();
        $south = $data->filter(function ($value, $key) {
            return $value['pod'] == "SOUTH";
        });
        $north = $data->filter(function ($value, $key) {
            return $value['pod'] == "NORTH";
        });

        $BOCExcel = new GeneratedExcel;

        $BOC = new ReceivingCopy($BOCExcel,$south,$this->ReceivingCopy,"SOUTH",$dateRange);
        $BOCExcel = $BOC->toExcel();
        $BOC = new ReceivingCopy($BOCExcel,$north,$this->ReceivingCopy,"NORTH",$dateRange);
        $BOCExcel = $BOC->toExcel();// $styles1 = array('font'=>'Arial','font-size'=>25,'height'=>30,'font-style'=>'bold', 'halign'=>'center', 'border'=>'left,right,top,bottom');

        $this->toExcel($BOCExcel,"receivingcopy_" . implode('_',$dateRange) . '.xls');






    }



    private function summarydata($rows,$headers)
    {
        $data = [];
        $ctr = 0;
        foreach($rows->toArray() as $row)
        {

            foreach($headers as $header=>$field){
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

    public function targetlodgement(Request $request){
        //return dd($request->input('docsids'));
        // $dateRange =  [$datefrom,$dateto];

        $docs = new EndorseExtractDocuments;

        if(empty($dateRange)){
            $dateRange = [];
        }

        $documents = new ImportDocument;
        $documents = $documents
        ->select('document_code','factory_abbr','bl_number','shipment_priority','document_received_date','document_received_time','turnover_process_date','ip_date','latest_estimated_time_arrival')
        ->leftJoin('m_factories','m_factories.factory_code','import_documents.factory_code')
        ->leftJoin('shipping_lines','shipping_lines.shipping_company_code','import_documents.shipping_company_code_fk')
        ->join('lodgement_details','document_code_fk','document_code')
        ->orderBy('m_factories.factory_code','ASC')
        ->whereIn('document_code',$request->input('docsids'))
        ->get();

        $data = $documents;


        $BOCExcel = new GeneratedExcel;

        $BOC = new ExtractPortal($BOCExcel,$data,$this->targetlodgementExtract,"Target Lodgement",$dateRange,[20,20,20,30,20,20,20,20,20,20]);
        $BOCExcel = $BOC->toExcel();

        $file = 'targetlodgement.xlsx';

        $BOCExcel->xlsWriter->writeToFile($file);
        if (file_exists($file)) {

            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="'.basename($file).'"');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($file));
            readfile($file);
            unlink($file);
            exit;

        }

    }

    public function endorsementextract($datefrom, $dateto){
        $dateRange =  [$datefrom,$dateto];

        $docs = new EndorseExtractDocuments;

        if(empty($dateRange)){
            $dateRange = [];
        }

        $documents = new ImportDocument;
        $documents = $documents->getEndorsementExtract($docs,$dateRange,'latest_estimated_time_arrival');


        $data = $documents;


        $BOCExcel = new GeneratedExcel;

        $BOC = new ExtractPortal($BOCExcel,$data,$this->endorsementExtract,"ENDORSEMENT EXTRACT",$dateRange,[20,20,20,30,20,20,20,20,20,20]);
        $BOCExcel = $BOC->toExcel();

        $file = 'example.xlsx';

        $BOCExcel->xlsWriter->writeToFile($file);
        if (file_exists($file)) {

            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="'.basename($file).'"');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($file));
            readfile($file);
            unlink($file);
            exit;

        }

    }
    public function boxextract($datefrom, $dateto){

        $dateRange =  [$datefrom,$dateto];

        $docs = new BOCExtractDocuments;

        if(empty($dateRange)){
            $dateRange = [];
        }

        $documents = new ImportDocument;
        $documents = $documents->getBOCExtract($docs,$dateRange,'turnover_process_date');


        $data = $documents;


        $BOCExcel = new GeneratedExcel;

        $BOC = new ExtractPortal($BOCExcel,$data,$this->bocextractportal,"BOC EXTRACT",$dateRange , [20,30,30,30,20,10,20,20,20,10,10,20,10,10,10,10,10]);
        $BOCExcel = $BOC->toExcel();

        $file = 'example.xlsx';

        $BOCExcel->xlsWriter->writeToFile($file);
        if (file_exists($file)) {

            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="'.basename($file).'"');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($file));
            readfile($file);
            unlink($file);
            exit;

        }
    }

    private function header($header)
    {
        $data = [];

        foreach(array_keys($header) as $header){
            $data[] = $header;
            if($header == 'NO. OF CONTAINERS'){
                $data[] = "";
            }
        }
        return $data;
    }

    private function checkzero($s20,$s40,$type = true)
    {
        $result = '';
        if($type){

            if($s20 > 0){
                $result .= $s20;
            }

            if($s40 > 0)
            {
                if($result == ''){
                    $result .= $s40;
                }else
                {
                    $result .= " , $s40";
                }

            }
        }
        else{
            if($s20 > 0){
                $result .= "20";
            }

            if($s40 > 0)
            {
                if($result == ''){
                    $result .= "40";
                }else
                {
                    $result .= " , 40";
                }

            }
        }

        return $result;
    }
}
