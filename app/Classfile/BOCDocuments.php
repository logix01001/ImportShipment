<?php

namespace App\Classfile;

use Illuminate\Support\Facades\DB;


class BOCDocuments extends ImportDocument
{

    public function __construct()
    {
        //FIELDS SELECTED
        //ALWAYS ADD FIELD HERE IF NECESSARY TO SHOW IN TABLE
        $this->selectedField = [

            'import_documents.id as impd_id',
            'lodgement_details.id as lodged_id',
            'document_code',
            'is_pezasent',
            'bl_number',
            'm_factories.factory_code',
            'factory_abbr',
            'factory_name',
            'estimated_time_arrival',
            'pod',
            'total_amount',
            DB::raw('IFNULL(lodgement_details.remarks_tag,"") as remarks_tag'),
            DB::raw('IFNULL(lodgement_details.op_number,"") as op_number'),
            DB::raw('IFNULL(lodgement_details.tsad_number,"") as tsad_number'),
            DB::raw('IFNULL(lodgement_details.ip_number,"") as ip_number'),
            DB::raw('IFNULL(lodgement_details.turnover_process_date,"") as turnover_process_date'),
            "size_20",
            "size_40",
            DB::raw('IFNULL(lodgement_details.ip_number,"") as ip_number'),

        ];
    }

}
