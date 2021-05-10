<?php

namespace App\Classfile;

use Exception;
use App\Jobs\EditByJob;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Facade\FlareClient\Http\Response;

/**
 *  Trait to reuse the Array map
 */
trait  HasUpdatetableColumn
{

   public static function updateColumn($docsID,$column,$value,$document_code = 'document_code')
   {

        if($column == 'is_document_received_processing'){

            try{
                DB::beginTransaction();

                self::whereIn($document_code,$docsID)
                    ->update([
                        'is_document_received_processing' => $value,
                        'document_received_processing_date' => $value == false ? null : date('Y-m-d'),
                        'document_received_processing_by' => $value == false ? null : Auth::user()->username,
                    ]);

                DB::commit();
                EditByJob::dispatch('is_document_received_processing', $docsID,$value, Auth::user()->username . ' - ' . Auth::user()->name);
                return response('',$status = 200,[]);
            }catch(\Exception $e){
                DB::rollback();
                Log::error('message');
                return response($e->getMessage(),$status = 500,[]);
            }
        }
        // elseif($column == 'ip_lodgement_incharge' || $column == 'e2m_lodgement_incharge')
        // {

        //     try{
        //         DB::beginTransaction();

        //         self::whereIn($document_code,$docsID)
        //             ->update([$column => $value == false ? null : Auth::user()->username]);

        //         DB::commit();
        //         EditByJob::dispatch($column, $docsID, $value , Auth::user()->username . ' - ' . Auth::user()->name);
        //         return response('',$status = 200,[]);
        //     }catch(\Exception $e){
        //         DB::rollback();
        //         Log::error('message');
        //         return response($e->getMessage(),$status = 500,[]);
        //     }
        // }
        elseif($column == 'ip_date' || $column == 'e2m_date')
        {

            $type = explode('_',$column)[0];
            try{
                DB::beginTransaction();

                self::whereIn($document_code,$docsID)
                    ->update([
                        $column => $value,
                        $type . '_lodgement_incharge' => $value == false ? null : Auth::user()->username
                    ]);

                DB::commit();
                EditByJob::dispatch($column, $docsID, $value , Auth::user()->username . ' - ' . Auth::user()->name);
                return response('',$status = 200,[]);
            }catch(\Exception $e){
                DB::rollback();
                Log::error('message');
                return response($e->getMessage(),$status = 500,[]);
            }
        }
        else{

            $forAdapter = new ForwarderAdapter(get_called_class(),$column,$document_code,$docsID,$value);

            try{
                DB::beginTransaction();

                self::whereIn($document_code,$docsID)
                    ->update([$column => $value]);

                $forAdapter->update();

                DB::commit();

                EditByJob::dispatch($column, $docsID, $value, Auth::user()->username . ' - ' . Auth::user()->name);
                return response('',$status = 200,[]);
            }catch(\Exception $e){
                DB::rollback();
                Log::error('message');
                return response($e->getMessage(),$status = 500,[]);
            }
        }



   }
}
