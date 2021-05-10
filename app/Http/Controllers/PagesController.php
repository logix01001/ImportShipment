<?php

namespace App\Http\Controllers;

use App\Models\ImportDocument;
use App\Models\User;
use Inertia\Inertia;
use App\Models\MFactory;
use App\Models\ShippingLine;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Auth;

class PagesController extends Controller
{
    //


    public function home()
    {

        if((Auth::user()->hasAnyRole(Role::all()))){
            $role = Auth::user()->roles[0]->name;
        }else{
            $role = '';
        }

        $users = User::all();

        $shippinglines = ShippingLine::
                        select('id','shipping_company_code','shipping_company_name','invoice_mk')
                        ->where('is_showed',1)
                        ->get();
        $factories = MFactory::select('id','factory_code','factory_abbr')->get();

        return Inertia::render('index',[
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


    public function targetLodgement()
    {

        $class = new ImportDocument;
        $class = $class->select('document_code','factory_abbr','bl_number','shipment_priority','document_received_date','document_received_time','turnover_process_date','ip_date','latest_estimated_time_arrival')
                ->leftJoin('m_factories','m_factories.factory_code','import_documents.factory_code')
                ->leftJoin('shipping_lines','shipping_lines.shipping_company_code','import_documents.shipping_company_code_fk')
                ->join('lodgement_details','document_code_fk','document_code')
                ->whereNull('turnover_process_date')
                ->orWhereNull('ip_date')
                ->orderBy('m_factories.factory_code','ASC');
        $data =  $class->get();

        return Inertia::render('target_lodgement',[
                'permissions'=> Auth::user()->permissions,
                'auth' => Auth::user() ,
                "dateNow" => date('Y-m-d'),
                "data" => $data
            ]
        );

    }
}
