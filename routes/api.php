<?php

use App\Models\MFactory;
use App\Models\LocalPayment;
use App\Models\ShippingLine;
use Illuminate\Http\Request;
use App\Classfile\ResponseStatus;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('/factories',function(){

    $factories = MFactory::select('id','factory_code','factory_abbr')->get();

    return ResponseStatus::success($factories);


});



Route::get('/shipping_lines',function(){
    $shippinglines =  ShippingLine::
            select('id','shipping_company_code','shipping_company_name','invoice_mk')
            ->where('is_showed',1)
            ->get();

    return ResponseStatus::success($shippinglines);
});


Route::get('/localpayments',function(){
    $payments =  LocalPayment::
            select('id','name')
            ->get();
    return ResponseStatus::success($payments);
});
