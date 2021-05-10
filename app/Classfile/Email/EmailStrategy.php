<?php

namespace App\ClassFile\Email;


class EmailStrategy {

    public $email;

    public function __construct(Isendmail $email){
        $this->email = $email;
    }

    public function send(){
       return $this->email->send();
    }

}
