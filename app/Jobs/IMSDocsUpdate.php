<?php

namespace App\Jobs;

use App\Models\ImsBl;
use Illuminate\Bus\Queueable;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Contracts\Queue\ShouldBeUnique;


class IMSDocsUpdate implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;



    protected $bl_no;
    protected $field;
    protected $value;
    protected $updatedby;
    /**
     * Create a new job instance.
     *
     * @return void
     */



    public function __construct($bl_no,$field,$value,$updatedby)
    {
        //

        $this->bl_no = $bl_no;
        $this->field = $field;
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

        if( ImsBl::where('bl_no', $this->bl_no)->count() > 0){


            try{
                DB::beginTransaction();

                ImsBl::where('bl_no', $this->bl_no)->update([ $this->field => $this->value]);

                DB::commit();

                Log::info("COLUMN : {$this->column}");
                Log::info("-----------------------------------------");
                Log::info("IMS UPDATING");
                Log::info("UPDATED BL {$this->bl_no}");
                Log::info("VALUE : {$this->value}");
                Log::info("UPDATED BY : {$this->updatedby}");
                Log::info("DATETIME: " . \date('Y-m-d H:i:s'));
                Log::info("-----------------------------------------");

            }catch(\Exception $e){
                DB::rollback();
                Log::error('message');
                return response($e->getMessage(),$status = 500,[]);
            }
        }else{

            Log::info("-----------------------------------------");
            Log::info("IMS UPDATING");
            Log::info("NO RECORD FOUND FOR BL {$this->bl_no}");
            Log::info("-----------------------------------------");

        }

    }
}
