<?php

namespace App\ClassFile\Email;


use App\Mail\PezaBOC;
use App\ClassFile\Email\Email;
use App\Models\LodgementDetail;
use App\Classfile\ResponseStatus;
use App\ClassFile\Email\Isendmail;
use App\ClassFile\Email\TPezaHeader;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class PezaEmail extends Email implements Isendmail{

    public $invoice;
    public $ip;
    public $lodgid;
    public $tsad;
    public $attachments = [];
    public $includedfiles = ["IMPORT","TSAD","INVOICE","PACKING"];
    public $findfiles = ["IMPORT" => 0,"TSAD" => 0,"INVOICE" => 0];
    public $turnover_process_date;
    public $bl_number;
    public $fullname;
    public $location;
    public $pod;
    public $factory_abbr;
    public $factory_name;

    protected $errors;

    use TPezaHeader;

    public function set_details(Object $data){

        $this->lodgid = $data->lodgid;
        $this->bl_number = $data->bl_number;
        $this->tsad = $data->tsad_number;
        $this->ip = $data->ip_number;
        $this->turnover_process_date = $data->turnover_process_date;
        $this->factory_abbr = $data->factory_abbr;
        $this->factory_name = $data->factory_name;
        $this->pod = $data->pod;
        $this->fullname = $data->fullname;
        $this->errors = [];
        $this->set_header( $this->tsad, $this->factory_name, $this->bl_number);
        $this->get_attachments();


    }

    public function set_invoice($invoice)
    {
        $this->invoice = $invoice;
    }

    public function set_fullname($name)
    {
        $this->fullname = $name;
    }


    public function get_attachments()
    {
        //ATTACHMENT INCLUDED
        //TRANSFER TO MASTERLIST
        $includedfiles = ["IMPORT","TSAD","INVOICE","PACKING"];
        //TURN TO 1 if FIND
        $findfiles = ["IMPORT" => 0,"TSAD" => 0,"INVOICE" => 0];

        $this->location = storage_path() . "/BOC/{$this->factory_abbr}/".date('Y',strtotime(  $this->turnover_process_date))."/".strtoupper(date('F',strtotime(  $this->turnover_process_date)))."/".date('mdy',strtotime(  $this->turnover_process_date))."/{$this->bl_number}";

        if(!file_exists($this->location)){

            $this->errors[] = "CANNOT FIND " . $this->location . " PLEASE CHECK FILE SERVER";
            //return ResponseStatus::failed(["msg" => $this->errors]);
        }


        $files = scandir( $this->location);
        foreach($files as $file)
        {
            $exploded = explode('_',$file);

            if(isset($exploded[1])){
                $filingmark = explode('.',$exploded[1])[0];
                foreach($includedfiles as $include)
                {

                    if(strpos($filingmark,$include)  !== false){
                        $this->attachments[] = "$file";
                        $findfiles[$include] = 1;
                    }
                }
            }
        }


        //CHECKING IF ALL ATTACHMENT ARE ATTACHED IN EMAIL
        if(array_sum($findfiles) < 3){

            $filefound = array_filter($findfiles,function($file){
                return $file == 0;
            });

            if(count($filefound) > 0){
                foreach(array_keys($filefound) as $file){
                    $this->errors[] = "{$file} ATTACHMENT NOT FOUND IN THE SERVER.";
                }
            }
        }


    }

    private function count_attachments()
    {

        if(count( $this->attachments ) < 3){
            $this->errors[] = "Lacking of Attachment, FOUND Attachment are (".implode(" , " , $this->attachments).")";
        }

    }

    public function send(){

        $this->count_attachments();

        $msg =  Mail::cc($this->cc);
        if(count( $this->errors) == 0){

            switch(strtoupper($this->pod))
            {
                case 'SOUTH':
                    $msg = $msg->to('sd1test@hrd-s.com');
                    break;
                case 'NORTH':
                    $msg = $msg->to('sd1test@hrd-s.com');
                    break;
                default:
                    return ResponseStatus::failed(["UNKNOWN POD"]);
                    break;
            }

            $msg->send(

                new PezaBOC(

                    [
                        "bl_number" => $this->bl_number,
                        "subject" => $this->subject,
                        "ip" => $this->ip,
                        "tsad" => $this->tsad,
                        "invoice" => $this->invoice,
                        "fullname" => $this->fullname,
                        "location" => $this->location,
                        "attachments" => $this->attachments,
                    ]

                )

            );


            LodgementDetail::find($this->lodgid)->update(['is_pezasent' => 1, 'pezasent_by' => Auth::user()->name, 'pezasent_date' => date('Y-m-d H:i:s')]);
            return ResponseStatus::success("EMAIL SENT.");

        }else{

            return ResponseStatus::failed($this->errors);
        }

    }





}
