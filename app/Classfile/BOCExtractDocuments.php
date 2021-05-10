<?php

namespace App\Classfile;

use Illuminate\Support\Facades\DB;


class BOCExtractDocuments extends ImportDocument
{

    public function __construct()
    {
        $this->selectedField = [
            'import_documents.id as impd_id',
            'lodgement_details.id as lodged_id',
            'document_code',
            'bl_number',
            'shipment_priority',
            'document_received_date',
            'm_factories.factory_code',
            'factory_abbr',
            'factory_name',
            'shipping_lines.shipping_company_code',
            'shipping_lines.shipping_company_name',
            'estimated_time_arrival',
            'actual_time_arrival',
            'pod',
            'registry_no',
            'connecting_vessel',
            'billing_received_date',
            'coordinator_payment_date',
            DB::raw('IFNULL(lodgement_details.ip_date,"") as ip_date'),
            DB::raw('IFNULL(lodgement_details.e2m_date,"") as e2m_date'),
            DB::raw('IFNULL(lodgement_details.ip_approval_date,"") as ip_approval_date'),
            DB::raw('IFNULL(lodgement_details.e2m_approval_date,"") as e2m_approval_date'),
            DB::raw('IFNULL(lodgement_details.turnover_process_date,"") as turnover_process_date'),
            "size_20",
            "size_40",


        ];
    }

}
