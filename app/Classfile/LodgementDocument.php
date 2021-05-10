<?php

namespace App\Classfile;

use Illuminate\Support\Facades\DB;


class LodgementDocument extends ImportDocument
{

    public function __construct()
    {
        //FIELDS SELECTED
        //ALWAYS ADD FIELD HERE IF NECESSARY TO SHOW IN TABLE
        //DB::RAW use for IF NULL convert to empty "" string to prevent
        //javascript error toLowerCase() filter.

        $this->selectedField = [
            'import_documents.id as impd_id',
            'lodgement_details.id as lodged_id',
            'document_code',
            'is_pezasent',
            'bl_number',
            'shipment_priority',
            'document_received_date',
            'document_received_time',
            'm_factories.factory_code',
            'factory_abbr',
            'shipping_lines.shipping_company_code',
            'shipping_lines.shipping_company_name',
            'import_documents.forwarder',
            'import_documents.estimated_time_arrival',
            DB::raw('IFNULL(laravel_logistic_project.bill_of_ladings.actual_time_arrival,"") as actual_time_arrival'),
            'import_documents.latest_estimated_time_arrival',
            'import_documents.pod',
            'import_documents.registry_no',
            'import_documents.connecting_vessel',
            'source_details',
            'transhipment_port',
            DB::raw('lodgement_details.is_document_received_processing as is_received'),
            DB::raw('IFNULL(lodgement_details.document_received_processing_date,"") as is_received_date'),
            DB::raw('IFNULL(lodgement_details.document_received_processing_by,"") as is_received_by'),
            DB::raw('IFNULL(lodgement_details.target_lodgement_date,"") as target_lodgement_date'),
            DB::raw('IFNULL(lodgement_details.document_status,"") as document_status'),
            DB::raw('IFNULL(lodgement_details.ip_date,"") as ip_date'),
            DB::raw('IFNULL(lodgement_details.e2m_date,"") as e2m_date'),
            DB::raw('IFNULL(lodgement_details.ip_checked_date,"") as ip_checked_date'),
            DB::raw('IFNULL(lodgement_details.e2m_checked_date,"") as e2m_checked_date'),
            DB::raw('IFNULL(lodgement_details.ip_approval_date,"") as ip_approval_date'),
            DB::raw('IFNULL(lodgement_details.e2m_approval_date,"") as e2m_approval_date'),
            DB::raw('IFNULL(lodgement_details.ip_number,"") as ip_number'),
            DB::raw('IFNULL(lodgement_details.tsad_number,"") as tsad_number'),
            DB::raw('IFNULL(lodgement_details.dutiable,"") as dutiable'),
            DB::raw('IFNULL(lodgement_details.turnover_process_date,"") as turnover_process_date'),
            "size_20",
            "size_40",
            DB::raw('IFNULL(lodgement_details.remarks_tag,"") as remarks_tag'),
            DB::raw('IFNULL(lodgement_details.assessment_tag,"") as assessment_tag'),
            DB::raw('IFNULL(lodgement_details.ip_lodgement_incharge,"") as ip_lodgement_incharge'),
            DB::raw('IFNULL(lodgement_details.e2m_lodgement_incharge,"") as e2m_lodgement_incharge'),
            // DB::raw('IFNULL(lodgement_details.invoice_item_number,"") as invoice_item_number'),
            DB::raw('FALSE as selected'),
        ];
    }

}
