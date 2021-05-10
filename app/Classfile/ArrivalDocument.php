<?php

namespace App\Classfile;

use Illuminate\Support\Facades\DB;


class ArrivalDocument extends ImportDocument
{

    public function __construct()
    {

        //FIELDS SELECTED
        //ALWAYS ADD FIELD HERE IF NECESSARY TO SHOW IN TABLE
        $this->selectedField = [
            'import_documents.id as impd_id',
            'lodgement_details.id as lodged_id',
            'document_code',
            'bl_number',
            'master_bl_number',
            'shipment_priority',
            'obl',
            'obl_received_date',
            'document_received_date',
            'document_received_time',
            'import_documents.processing_date',
            'processing_time',
            'sps_ic_number',
            'm_factories.factory_code',
            'factory_abbr',
            'shipping_lines.shipping_company_code',
            'shipping_lines.shipping_company_name',
            'import_documents.forwarder',
            'import_documents.estimated_time_arrival',
            'source_eta',
            DB::raw('IFNULL(laravel_logistic_project.bill_of_ladings.actual_time_arrival,"") as actual_time_arrival'),
            DB::raw('IFNULL(MAX(laravel_logistic_project.containers.actual_discharge),"") as actual_discharge'),
            'import_documents.latest_estimated_time_arrival',
            'import_documents.pod',
            'import_documents.registry_no',
            'import_documents.connecting_vessel',
            'source_details',
            'transhipment_port',
            'credit_line',
            'prepaid',
            'billing_request_date',
            'billing_received_date',
            'coordinator_payment_date',
            //'coordinator_remarks',
            'endorse_date',
            'cro_web_date',
            'cro_received_date',
            'cro_validity',
            'remarks_others',
            "size_20",
            "size_40",
            DB::raw('FALSE as selected'),
        ];
    }


}
