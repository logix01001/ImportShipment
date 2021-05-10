<?php

namespace App\ClassFile\Email;


trait TPezaHeader {


    /**
     * @param string tsad - tsad number
     * @param string factory - factoryname
     * @param string bl_number - bl number
     */

    protected function set_header($tsad,$factory,$bl_number){

        $this->subject = "T {$tsad} - {$factory} - Online PEZA e-IP Validation - {$bl_number}";

    }


}
