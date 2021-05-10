<?php

namespace App\Classfile;

use Illuminate\Support\Facades\DB;


class EndorseExtractDocuments extends ImportDocument
{

    public function __construct()
    {
        $this->selectedField = [
            'import_documents.id as impd_id',
            'lodgement_details.id as lodged_id',
            'document_code',
            'bl_number',
            'shipment_priority',
            'm_factories.factory_code',
            'factory_abbr',
            'factory_name',
            'shipping_lines.shipping_company_code',
            'shipping_lines.shipping_company_name',
            'pod',
            'registry_no',
            'forwarder',
            'latest_estimated_time_arrival',
            'connecting_vessel',
        ];
    }

}
