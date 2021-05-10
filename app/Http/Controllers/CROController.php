<?php

namespace App\Http\Controllers;

use Inertia\Inertia;
use Illuminate\Http\Request;
use App\Models\ImportDocument;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class CROController extends Controller
{
    //

    public function index()
    {
        $class = new ImportDocument;
        $class = $class->joinwithIms(
                                [
                                'bl_number',
                                'shipment_priority',
                                'import_documents.forwarder',
                                'import_documents.estimated_time_arrival',
                                DB::raw('IFNULL(MAX(laravel_logistic_project.containers.actual_discharge),"") as actual_discharge'),
                                'cro_web_date',
                                'cro_received_date'
                                ]
                            )
                            ->where('actual_discharge','<',\date('Y-m-d'))
                            ->whereNull('cro_web_date')
                            ->orderBy('m_factories.factory_code','ASC')
                            ->groupBy('impd_id')
                            ->groupBy('lodged_id')
                            ->groupBy('factory_abbr')
                            ->groupBy('shipping_company_code')
                            ->groupBy('shipping_company_name')
                            ->groupBy('laravel_logistic_project.bill_of_ladings.actual_time_arrival');

        $data =  $class->get();

        return Inertia::render('croweblists',[
                'permissions'=> Auth::user()->permissions,
                'auth' => Auth::user() ,
                "dateNow" => date('Y-m-d'),
                "data" => $data
            ]
        );
    }
}
