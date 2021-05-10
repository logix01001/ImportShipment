<?php

namespace App\Http\Controllers;

use App\Models\User;
use Inertia\Inertia;
use App\Models\MFactory;
use App\Models\ShippingLine;
use Illuminate\Http\Request;
use App\Models\ImportDocument;
use App\Classfile\BOCDocuments;
use App\Classfile\ResponseStatus;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Auth;

class BocProcessing extends Controller
{
    //

    public function index()
    {
        if((Auth::user()->hasAnyRole(Role::all()))){
            $role = Auth::user()->roles[0]->name;
        }else{
            $role = '';
        }

        $users = User::all();

        $shippinglines = ShippingLine::
                        select('id','shipping_company_code','shipping_company_name','invoice_mk')->get();
        $factories = MFactory::select('id','factory_code','factory_abbr')->get();

        return Inertia::render('boc_processing',[
            "msg"=>'helloworld',
            'myRole' => $role,
            'permissions'=> Auth::user()->permissions,
            'auth' => Auth::user() ,
            "dateNow" => date('Y-m-d'),
            "user_lists" =>  $users,
            "shippinglines" => $shippinglines,
            "factories" =>  $factories
            ]
        );

    }

    public function documents(Request $request)
    {
        $dateRange = $request->input('daterange');


        // $arrivalDocs = ['ARRIVAL UPDATE','COORDINATOR','CRO MONITORING'];
        // $lodgeDocs = ['LODGEMENT','LEADER LODGEMENT'];


        $docs = new BOCDocuments;
        if(empty($dateRange)){
            $dateRange = [];
        }
        $documents = new ImportDocument;
        $documents = $documents->setDocumentBoc($docs,$dateRange,'turnover_process_date');
        $data = $documents->get();
        return ResponseStatus::success($data);
    }
}
