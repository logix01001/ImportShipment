<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class PezaBOC extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */

    public $details;

    public function __construct(Array $details)
    {
        //
        $this->details = $details;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $ip = $this->details['ip'];
        $tsad = $this->details['tsad'];
        $invoice = $this->details['invoice'];
        $subject = $this->details['subject'];
        $fullname = $this->details['fullname'];
        $location = $this->details['location'];
        $attachments = $this->details['attachments'];


        $msg = $this->from('hrdimportbrokerage@hrd-s.com')
            ->subject($subject)
			->view('emails.Peza',compact('ip','tsad','invoice','fullname'));

        foreach( $attachments as $attachment){
            $msg = $msg->attach("$location/$attachment");
        }

        return $msg;
    }
}
