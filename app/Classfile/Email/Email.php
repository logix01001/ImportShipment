<?php

namespace App\ClassFile\Email;



use Illuminate\Support\Facades\Mail;


abstract class Email{


    public $subject;
    public $to;
    public $cc;


    /**
     * @param string $to - Receiver of email
     * @param Array $cc - CC of email
     *
     */
    public function __construct(String $to,Array $cc = []){
        $this->to = $to;
        $this->cc = $cc;
    }


}
