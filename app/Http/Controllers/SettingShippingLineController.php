<?php

namespace App\Http\Controllers;

use Exception;
use Inertia\Inertia;
use App\Jobs\EditByJob;
use App\Models\ShippingLine;
use Illuminate\Http\Request;
use App\Classfile\ResponseStatus;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class SettingShippingLineController extends Controller
{
    //
    public function indexPage(){

        $shippinglines = ShippingLine::all();
        return Inertia::render('Settings/ImportSL',[
            'auth'=>Auth::user(),
            'permissions'=> Auth::user()->permissions,
            'shipping_lines' =>  $shippinglines]);
    }

    public function updateShow(Request $request)
    {
        try{
            DB::beginTransaction();

            $sl = ShippingLine::findOrfail($request->input('sl_id'));
            $sl->is_showed = $request->input('is_showed');
            $sl->update();

            DB::commit();
            return ResponseStatus::success(["msg"=>"successfully saved"]);
        }catch(Exception $e)
        {
            DB::rollback();
            return ResponseStatus::failed(["msg"=>$e->getMessage()]);
        }

    }
}
