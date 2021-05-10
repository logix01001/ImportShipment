<?php

namespace App\ClassFile\Email;

use App\CadRequest;


trait TCadRequestView {

    protected function cad_request_body(){

        return view('Cademail.cadlayout',compact('project_name','construction_code','plan_number','header','footer'));

    }


}
