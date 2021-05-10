<?php

namespace App\Classfile;

use App\Models\ImsBl;
use App\Jobs\IMSDocsUpdate;

/**
 *  Trait to reuse the Array map
 */
class ImsUpdate
{

    public $imsfields = [

        "tsad_number" => 'tsad_no',
        "remarks_tag" => 'remarks_of_docs',
        "ip_approval_date" => 'date_approve_ip',
        "assessment_tag" => 'assessment_tag',
        "e2m_date" => 'e2m',
        "turnover_process_date" => 'processing_date'






    ];

    /**
     * @param array $array - Array data
     * @param string $key - Key for mapping
     */



    public function __construct($bl_no,$field,$value,$updatedby)
    {

        if($this->checkExist($field)){
            IMSDocsUpdate::dispatch($bl_no,$field,$value,$updatedby);
        }
    }


    /**
     * @param string $field - Field to check
     *
     */
    private function checkExist($field)
    {
        return array_key_exists($field,$this->imsfields);
    }
}
