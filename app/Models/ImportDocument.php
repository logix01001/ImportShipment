<?php

namespace App\Models;

use App\Classfile\HasColumnLists;
use App\Classfile\HasNullableToString;
use App\Classfile\HasUpdatetableColumn;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Classfile\ImportDocument as ClassfileImportDocument;

class ImportDocument extends Model implements Auditable
{

    protected $connection = 'mysql';
    use HasFactory;
    use HasColumnLists;
    use HasUpdatetableColumn;
    use \OwenIt\Auditing\Auditable;
    use HasNullableToString;

    public static function lastDoc()
    {
        return self::select('document_code')->orderBy('id','DESC')->first();
    }

    public function groupIms()
    {

    }

    public function joinwithIms(Array $selectedfield)
    {
        $defaultfield = ['import_documents.id as impd_id',
            'lodgement_details.id as lodged_id',
            'factory_abbr',
            'document_code',
            'bl_number',
            'shipping_company_code',
            'shipping_company_name',
            'laravel_logistic_project.bill_of_ladings.actual_time_arrival',
            ];
        $selectedfield = array_merge( $defaultfield ,$selectedfield);
        $class =  $this->select($selectedfield)
        ->leftJoin('laravel_logistic_project.bill_of_ladings','laravel_logistic_project.bill_of_ladings.bl_no','import_documents.bl_number')
        ->leftJoin('laravel_logistic_project.containers','laravel_logistic_project.containers.bl_no_fk','import_documents.bl_number')
        ->leftJoin('m_factories','m_factories.factory_code','import_documents.factory_code')
        ->leftJoin('shipping_lines','shipping_lines.shipping_company_code','import_documents.shipping_company_code_fk')
        ->join('lodgement_details','document_code_fk','document_code');
        // ->orderBy('m_factories.factory_code','ASC')
        // ->groupBy('impd_id')
        // ->groupBy('lodged_id')
        // ->groupBy('factory_abbr')
        // ->groupBy('shipping_company_code')
        // ->groupBy('shipping_company_name')
        // ->groupBy('laravel_logistic_project.bill_of_ladings.actual_time_arrival');

        return $class;

    }

    public function setDocument(ClassfileImportDocument $importDocument,$daterange = [],String $whereField = 'document_received_date')
    {

       $class =  $this->select($importDocument->selectedField)
        ->leftJoin('laravel_logistic_project.bill_of_ladings','laravel_logistic_project.bill_of_ladings.bl_no','import_documents.bl_number')
        ->leftJoin('laravel_logistic_project.containers','laravel_logistic_project.containers.bl_no_fk','import_documents.bl_number')
        ->leftJoin('m_factories','m_factories.factory_code','import_documents.factory_code')
        ->leftJoin('shipping_lines','shipping_lines.shipping_company_code','import_documents.shipping_company_code_fk')
        ->join('lodgement_details','document_code_fk','document_code')
        ->orderBy('m_factories.factory_code','ASC')
        ->groupBy('impd_id')
        ->groupBy('lodged_id')
        ->groupBy('factory_abbr')
        ->groupBy('shipping_company_code')
        ->groupBy('shipping_company_name')
        ->groupBy('laravel_logistic_project.bill_of_ladings.actual_time_arrival');




        if(count($daterange) == 2){
            $class =  $class->whereBetween($whereField,$daterange);
        }
        return $class;
    }


    public function setDocumentBoc(ClassfileImportDocument $importDocument,$daterange = [],String $whereField = 'document_received_date')
    {

       $class =  $this->select($importDocument->selectedField)
        ->leftJoin('m_factories','m_factories.factory_code','import_documents.factory_code')
        ->leftJoin('shipping_lines','shipping_lines.shipping_company_code','import_documents.shipping_company_code_fk')
        ->join('lodgement_details','document_code_fk','document_code')
        ->orderBy('m_factories.factory_code','ASC');



        if(count($daterange) == 2){
            $class =  $class->whereBetween($whereField,$daterange);
        }
        return $class;
    }

    public static function getBOCExtract(ClassfileImportDocument $importDocument,$daterange = [],String $whereField = 'document_received_date')
    {
        $class = new self;
        $class =  $class->select($importDocument->selectedField)
            ->leftJoin('m_factories','m_factories.factory_code','import_documents.factory_code')
            ->leftJoin('shipping_lines','shipping_lines.shipping_company_code','import_documents.shipping_company_code_fk')
            ->join('lodgement_details','document_code_fk','document_code')
            ->orderBy('m_factories.factory_code','ASC');


        if(count($daterange) == 2){
            $class =  $class->whereBetween($whereField,$daterange);
        }


        $data = $class->get()->toArray();
        $ctr = 0;



        foreach($data as $row){
            $result = ImsBl::select('commodity','bl_no','container_number','actual_berthing_date','target_gatepass','actual_gatepass','actual_discharge')
                        ->join('containers','containers.bl_no_fk','bill_of_ladings.bl_no')
                        ->join('bill_of_lading_commodities','bill_of_lading_commodities.bl_no_fk','bill_of_ladings.bl_no')
                        ->where('bill_of_ladings.bl_no',$row['bl_number'])
                        ->first();
            if( $result != null){
                $data[$ctr] = array_merge($data[$ctr],$result->toArray());
            }else{
                $data[$ctr] = array_merge($data[$ctr],[
                    "commodity" => "",
                    "bl_no" => "",
                    "container_number" => "",
                    "actual_berthing_date" => "",
                    "target_gatepass" => "",
                    "actual_gatepass" => "",
                    "actual_discharge" => ""
                ]);
            }

            $ctr++;
        }

        return $data;
    }

    public static function getEndorsementExtract(ClassfileImportDocument $importDocument,$daterange = [],String $whereField = 'document_received_date')
    {
        $class = new self;
        $class =  $class->select($importDocument->selectedField)
            ->leftJoin('m_factories','m_factories.factory_code','import_documents.factory_code')
            ->leftJoin('shipping_lines','shipping_lines.shipping_company_code','import_documents.shipping_company_code_fk')
            ->join('lodgement_details','document_code_fk','document_code')
            ->orderBy('m_factories.factory_code','ASC');


        if(count($daterange) == 2){
            $class =  $class->whereBetween($whereField,$daterange);
        }


        $data = $class->get()->toArray();

        return $data;
    }




    public static function s_setDocument(ClassfileImportDocument $importDocument,$daterange = [])
    {

        $class = new self;
        $class = $class->select($importDocument->selectedField)
        ->leftJoin('m_factories','m_factories.factory_code','import_documents.factory_code')
        ->leftJoin('shipping_lines','shipping_lines.shipping_company_code','import_documents.shipping_company_code_fk')
        ->join('lodgement_details','document_code_fk','document_code');

        if(count($daterange) == 2){
            $class =  $class->whereBetween('document_received_date',$daterange);
        }


        return json_encode($class);
    }


    protected function setData($key, $value)
    {
        array_walk_recursive($value, function (&$item, $key) {
            $item = null === $item ? '' : $item;
        });
        $this->data[$key] = $value;
        return $this->data;
    }

    //Accessor




    public function getMasterBlNumberAttribute($value)
    {
        return $this->nullableValue($value);
    }

    public function getProcessingDateAttribute($value)
    {
        return $this->nullableValue($value);
    }

    public function getCroWebDateAttribute($value)
    {
        return $this->nullableValue($value);
    }

    public function getTranshipmentPortAttribute($value)
    {
        return $this->nullableValue($value);
    }

    public function getLatestEstimatedTimeArrivalAttribute($value)
    {
        return $this->nullableValue($value);
    }

    public function getForwarderAttribute($value)
    {
        return $this->nullableValue($value);
    }

    public function getSourceEtaAttribute($value)
    {
        return $this->nullableValue($value);
    }

    public function getProcessingTimeAttribute($value)
    {
        return $this->nullableValue($value);
    }

    public function getSpsIcNumberAttribute($value)
    {
        return $this->nullableValue($value);
    }

    public function getEstimatedTimeArrivalAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getActualTimeArrivalAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getPodAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getRegistryNoAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getConnectingVesselAttribute($value)
    {

        return $this->nullableValue($value);
    }
    public function getSourceDetailsAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getCreditLineAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getPrepaidAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getBillingRequestDateAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getBillingReceivedDateAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getCoordinatorPaymentDateAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getCoordinatorRemarksAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getEndorseDateAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getCroReceivedDateAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getCroValidityAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getRemarksOthersAttribute($value)
    {
        return $this->nullableValue($value);
    }

    public function getOblAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getOblReceivedDateAttribute($value)
    {
        return $this->nullableValue($value);
    }







}
