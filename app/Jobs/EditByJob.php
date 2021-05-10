<?php

namespace App\Jobs;

use Illuminate\Http\Request;
use Illuminate\Bus\Queueable;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Contracts\Queue\ShouldBeUnique;

class EditByJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */

    public $column;
    public $docsid;
    public $value;
    public $updatedby;

    public function __construct($column,$docsid,$value,$updatedby)
    {
        //

        $this->column = $column;
        $this->docsid = $docsid;
        $this->value = $value;
        $this->updatedby = $updatedby;
    }
    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        //
        // . Auth::user()->username . ' - ' . Auth::user()->name); json_encode(Auth::user()) .
        LOG::info("-----------------------------------------");
        Log::info("COLUMN : {$this->column}");
        Log::info("DOCS ID : " .  json_encode($this->docsid));
        Log::info("VALUE : {$this->value}");
        Log::info("UPDATED BY : {$this->updatedby}");
        Log::info("DATETIME: " . \date('Y-m-d H:i:s'));
        LOG::info("-----------------------------------------");
    }
}
