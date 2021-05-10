<?php

namespace App\Http\Controllers;

use App\Classfile\IDoc;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\ImportDocument;
use App\Models\LodgementDetail;
use App\Classfile\ResponseStatus;
use Illuminate\Support\Facades\DB;

class ImportDocumentResource extends Controller
{




    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        //User Request

        $doc = new IDoc;
        $ur = $request->input('data');

        /**
         * @param bl_number String
         * @param shipping_line_code String
         * @param consignee String
         * @param document_received_date date
         * @param document_received_time String
         * @param sps_ic_number String
        */



        $document = new ImportDocument;
        $lodgement = new LodgementDetail;

        $docid =  $doc->generate();

        $document->document_code = $docid;
        $lodgement->document_code_fk = $docid;

        $document->bl_number = $ur['bl_number'];
        $document->shipping_company_code_fk = $ur['shipping_line_code'];
        $document->factory_code = $ur['consignee'];
        $document->document_received_date = $ur['document_received_date'];
        $document->document_received_time = $ur['document_received_time'];
        $document->sps_ic_number = $ur['sps_ic_number'];


        try{
            DB::beginTransaction();

            $document->save();
            $lodgement->save();

            DB::commit();
        }catch(\Exception $e){
            DB::rollback();
            return ResponseStatus::failed($e->getMessage());
        }




    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
