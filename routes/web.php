<?php

use App\Models\User;
use Inertia\Inertia;
use App\Models\ImsBl;
use App\Mail\TestMail;
use App\Classfile\IDoc;
use App\Jobs\EditByJob;
use App\Models\MFactory;
use App\Jobs\IMSDocsUpdate;
use App\Models\ShippingLine;
use Illuminate\Http\Request;
use App\Models\ImportDocument;
use Illuminate\Support\Carbon;
use App\Classfile\BOCDocuments;
use App\Models\ContainerAmount;
use App\Models\LodgementDetail;
use App\Classfile\ResponseStatus;
use App\Classfile\ArrivalDocument;
use App\ClassFile\Email\PezaEmail;
use App\Http\Controllers\BOCExcel;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Log;
use App\Classfile\LodgementDocument;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;
use App\Classfile\FactoryDocumentUpdate;
use Spatie\Permission\Models\Permission;
use App\Http\Controllers\PagesController;
use App\Http\Controllers\InchargeResource;
use App\Http\Controllers\ImportDocumentResource;
use App\Http\Controllers\SettingInchargeController;
use App\Http\Controllers\SettingShippingLineController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('login');
});

Auth::routes();

Route::post('/login-cust' , [App\Http\Controllers\Auth\LoginController::class,'login'])->name('auth.login');
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get('/index',[PagesController::class,'home'])->middleware('auth')->name('home.index');

Route::get('/boc_processing',[App\Http\Controllers\BocProcessing::class,'index'])->middleware('auth')->name('boc.index');

Route::get('/target_lodgement',[PagesController::class,'targetLodgement'])->middleware('auth')->name('pages.target_lodgement');


Route::middleware(['auth'])->prefix('settings')->group(function () {

    Route::get('/incharge',[SettingInchargeController::class,'inchargePage'])->middleware('HasPermission:access-settings')->name('incharge.index');
    Route::post('/incharge/newuser',[SettingInchargeController::class,'newuser'])->middleware('HasPermission:access-settings')->name('incharge.newuser');
    Route::post('/assignRole',[SettingInchargeController::class,'saveRole']);

    Route::get('/shippingline',[SettingShippingLineController::class,'indexPage'])->middleware('HasPermission:access-settings')->name('settings.shippingline.index');
    Route::put('/shippingline',[SettingShippingLineController::class,'updateShow'])->middleware('HasPermission:access-settings')->name('settings.shippingline.put');
});


Route::get('/login',function(){

    if(Auth::user()){
        return redirect('/index');
    }
    return Inertia::render('login',["msg"=>'helloworld']);

})->name('login');


Route::resource('user_incharge', InchargeResource::class,[

    'names' => [
        'update' => 'user_incharge.update',
        // etc...
    ]

])->only(['update']);

Route::resource('new_record', ImportDocumentResource::class,[]);

Route::get('/dev',function(){

    $user = User::find(1);
    //return $user->getAllPermissions();
    $user->givePermissionTo([]);
    return $user->getAllPermissions();
    return false;
    // $ims = new IMSDocsUpdate("EGLV020100155566","target_gatepass","2021-06-10","JEROME");
    // return dd($ims->handle());

//     $dateRange = ["2021-02-02","2021-02-02"];

//     $begin = new DateTime( $dateRange[0] );
// $end = new DateTime( $dateRange[1] );
// $end = $end->modify( '+1 day' );

// $interval = new DateInterval('P1D');
// $daterange = new DatePeriod($begin, $interval ,$end);
// $daterangearray = [];
// foreach($daterange as $date){
//     $daterangearray[]  =  $date->format("Y-m-d");
// }
// return  $daterangearray;

    // $start = $dateRange[0];

    // $end = isset($dateRange[1]) ? $dateRange[1] : $dateRange[0];

    // $period = new DatePeriod(
    //         new DateTime( $start),
    //         new DateInterval('P2D'),
    //         new DateTime($end)
    // );
    // $datearray = [];
    // foreach ($period as $key => $value) {
    //     $datearray[] = $value->format('Y-m-d');
    // }

    // return $datearray;

    //User::insert(['name'=>"Jerome Del Rosario",'username' => "028731",'password'=> Hash::make('028731')]);
    //User::insert(['name'=>"Michael Allan Carino",'username' => "016273",'password'=> Hash::make('016273')]);
    // User::insert(['name'=>"MARGIE P. CESTINA",'username' => "39726",'password'=> Hash::make('39726')]);
    // User::insert(['name'=>"ALONA C. CANA",'username' => "38671",'password'=> Hash::make('38671')]);
    // User::insert(['name'=>"MERYLOU A. PASCUA",'username' => "37950",'password'=> Hash::make('37950')]);
    // User::insert(['name'=>"AILENE A. DE ROSAS",'username' => "37264",'password'=> Hash::make('37264')]);
    // User::insert(['name'=>"ARIEL A. BALDEVIA",'username' => "33381",'password'=> Hash::make('33381')]);
    // User::insert(['name'=>"MARIEL D. RESURRECCION",'username' => "35706",'password'=> Hash::make('35706')]);
    // User::insert(['name'=>"CARILLE A. DAYAWON",'username' => "38672",'password'=> Hash::make('38672')]);
    // User::insert(['name'=>"MANILYN S. SURETA",'username' => "39640",'password'=> Hash::make('39640')]);
    // User::insert(['name'=>"SHIELA MARIE B. VILLEGAS",'username' => "39725",'password'=> Hash::make('39725')]);
    // User::insert(['name'=>"JOHN WILFRED R. RATONEL",'username' => "28991",'password'=> Hash::make('28991')]);
    // User::insert(['name'=>"JEREL A. MANZANO",'username' => "28972",'password'=> Hash::make('28972')]);
    // User::insert(['name'=>"DONEL C. ESTOCE",'username' => "29026",'password'=> Hash::make('29026')]);
    // User::insert(['name'=>"REENIER MARK B. TIBOR",'username' => "29257",'password'=> Hash::make('29257')]);
    // User::insert(['name'=>"ESTHER V. DIONGLAY",'username' => "18021",'password'=> Hash::make('18021')]);
    // User::insert(['name'=>"KRISTINA S. SAYO",'username' => "20525",'password'=> Hash::make('20525')]);
    // User::insert(['name'=>"RHENGIBELL G. GLUDA",'username' => "27275",'password'=> Hash::make('27275')]);
    // User::insert(['name'=>"ELMA V. DELA VEGA",'username' => "27677",'password'=> Hash::make('27677')]);
    // User::insert(['name'=>"JANET A. TUMANAN",'username' => "28155",'password'=> Hash::make('28155')]);

    // $field = ['shipping_company_code','shipping_company_name','invoice_mk'];
    // $data = [
    //     [24,	"NAMSUNG",	"U"],
    //     [27,	"FLATRACK",	"9"],
    //    [ 10,	"HYUNDAI",	"Y"],
    //     [20,	"COSCO",	"X"],
    //     [9,	"HEUNG-A/WALLEM",	"A"],
    //     [11,	"YANG MING",	"G"],
    //     [13,	"CHINA SHIPPING",	"N"],
    //     [14,	"SITC",	"I"],
    //     [16,	"SINOKOR",	"R"],
    //     [1,	"K'LINE",	"K"],
    //     [2,	"TSK",	"T"],
    //     [3,	"HANJIN",	"H"],
    //     [4,	"OOCL",	"O"],
    //     [ 5,	"KMTC",	"C"],
    //     [6,	"EVERGREEN",	"E"],
    //     [7,	"WANHAI",	"W"],
    //     [8,	"MAERSK",	"M"],
    //     [12,	"MOL",	"S"],
    //     [15,"TS LINES",	"L"],
    //     [18,	"SYMS/SCHENKER",	"D"],
    //     [19,	"APL",	"P"],
    //     [22, "GOLD STAR",	"B"],
    //     [23,	"AIR",	"Z"],
    //     [21,	"CMA&CGM","V"],
    //     [25,	"CK LINE",	"F"],
    //     [26,"ONE",	"J"],

    // ];

    // foreach($data as $row){
    //     $combine = array_combine($field,$row);
    //     //print_r($combine);
    //     ShippingLine::create($combine);
    // }


    // $field = ['factory_code','factory_abbr','factory_name'];
    // $data = [
    //     ['100',	"PV TECH",	"PV Tech (S) Pte., Ltd."],
    //     ['101',	"SCAD",	"SCAD Services (S) Pte., Ltd."],
    //     ['102',	"HTI",	"House Technology Industries Pte., Ltd."],
    //     ['103',	"HRD",	"HRD Singapore Pte., Ltd."],
    //     ['104',	"WUKONG",	"Wu Kong Singapore Pte., Ltd."],
    //     ['105',	"MAJESTIC",	"Majestic Landscape Corporation"],

    // ];

    // foreach($data as $row){
    //     $combine = array_combine($field,$row);
    //     //print_r($combine);
    //     MFactory::insert($combine);
    // }


    // $doc = new IDoc;
    // return $doc->generate();

    // $arrival = new ArrivalDocument;
    // $lodgement = new LodgementDocument;

    // $user = new ImportDocument;
    // $user = new LodgementDetail;
    // $table = $user->getTable();


    // $columns = DB::getSchemaBuilder()->getColumnListing($table);
    // dd($columns);

});

Route::post('/documents',function(Request $request){

    $docType = $request->input('doctype');
    $dateRange = $request->input('daterange');

    // $arrivalDocs = ['ARRIVAL UPDATE','COORDINATOR','CRO MONITORING'];
    // $lodgeDocs = ['LODGEMENT','LEADER LODGEMENT'];

    if($docType == 'ARRIVAL'){
        $docs = new ArrivalDocument;
    }else{
        $docs = new LodgementDocument;
    }

    if(empty($dateRange)){
        $dateRange = [];
    }
    $documents = new ImportDocument;
    $documents = $documents->setDocument($docs,$dateRange);
    $data = $documents->get();
    return ResponseStatus::success($data);


});

Route::post('/bocDocuments',[App\Http\Controllers\BocProcessing::class,'documents']);


Route::get('/cro_web_lists',[App\Http\Controllers\CROController::class,'index'])->middleware('auth')->name('croweblists.index');


Route::put('/volumedocument',function(Request $request)
{

    $docID = $request->input('docsID');
    $volume = $request->input('volume');
    $total = ($volume["size_20"] + $volume["size_40"]);

    $amount = ContainerAmount::where('no_containers',$total)->first()->amount;
    try{
        DB::beginTransaction();

        ImportDocument::whereIn('document_code',$docID)
                        ->update(
                            [
                                "size_20" => $volume["size_20"],
                                "size_40" => $volume["size_40"],
                                "total_amount"=> $amount
                            ]
                            );

        DB::commit();
        Log::info('VOLUME UPDATE --'. json_encode($volume) . ' UPDATE BY ' . Auth::user()->username . ' - ' . Auth::user()->name);
        return response('',$status = 200,[]);
    }catch(\Exception $e){
        DB::rollback();
        Log::error('VOLUME ERROR UPDATE --' . json_encode($volume) . ' UPDATE BY ' . Auth::user()->username . ' - ' . Auth::user()->name);

        return response($e->getMessage(),$status = 500,[]);
    }

});

Route::put('/opnumber',function(Request $request)
{

    $docID = $request->input('docID');
    $op_number = $request->input('op_number');

    try{
        DB::beginTransaction();

        LodgementDetail::where('document_code_fk',$docID)
                        ->update(
                            [
                                "op_number" =>  $op_number,
                            ]
                        );
        DB::commit();
        EditByJob::dispatch('op_number', $docID,$op_number,Auth::user()->username . ' - ' . Auth::user()->name);
        //Log::info('OP Number UPDATE --'. json_encode(["docid" => $docID, "op_number"=>$op_number]) . ' UPDATE BY ' . Auth::user()->username . ' - ' . Auth::user()->name);
        return response('',$status = 200,[]);
    }catch(\Exception $e){
        DB::rollback();
        Log::error('VOLUME ERROR UPDATE --' . json_encode(["docid" => $docID, "op_number"=>$op_number]) . ' UPDATE BY ' . Auth::user()->username . ' - ' . Auth::user()->name);
        return response($e->getMessage(),$status = 500,[]);
    }

})->name('put.opnumber');

Route::put('/updatedocument',function(Request $request)
{
    $updateDocument = new FactoryDocumentUpdate($request);
    //Log::info('TEST ONLY');
    return $updateDocument->update();
});


Route::put('/received_document',function(Request $request)
{
    // $updateDocument = new FactoryDocumentUpdate($request);

    // return $updateDocument->update();

    $is_received = $request->input('is_received');
    $docsID = $request->input('document_code');



    try{
        DB::beginTransaction();

        LodgementDetail::where('document_code',$docsID)
            ->update([
                "is_document_received_processing"=> $is_received,
                "document_received_processing_date" => date('Y-m-d'),
                "document_received_processing_by" => Auth::user()->username,
            ]);

        DB::commit();
        EditByJob::dispatch('is_document_received_processing', $docsID,$is_received,Auth::user()->username . ' - ' . Auth::user()->name);
        return response('',$status = 201,[]);
    }catch(\Exception $e){
        DB::rollback();
        Log::error('message');
        return response($e->getMessage(),$status = 500,[]);
    }



});


Route::get('/send_mail', function ($name = 'guest') {
    Mail::to('sd1test@hrd-s.com')
        ->send(new TestMail);
    return "Test message was send to ";
});

Route::get('/downloadexcelBOC/{datefrom?}/{dateto?}',[BOCExcel::class,"summary"]);
Route::get('/downloadexcelBOCCopy/{datefrom?}/{dateto?}',[BOCExcel::class,"receivingcopy"]);

//EXTRACTION
Route::get('/downloadexcelBOCExtraction/{datefrom?}/{dateto?}',[BOCExcel::class,"boxextract"]);
Route::get('/downloadexcelEndorsementExtraction/{datefrom?}/{dateto?}',[BOCExcel::class,"endorsementextract"]);
Route::get('/downloadexcelTargetLodgementExtraction',[BOCExcel::class,"targetlodgement"]);

Route::get('/testjob',function(){
     IMSDocsUpdate::dispatch('NSSLATXG21C00205','actual_time_arrival','2021-04-28');
});




Route::get('/sendEmail/{id}',function($id){

    $data = LodgementDetail::getDetailsEmail($id);

    if(count($data) > 0){
        //'
        try {
            $peza = new PezaEmail('sd1test@hrd-s.com',['sd3_qa@hrd-s.com','hrdimportbrokerage@hrd-s.com']);
            $peza->set_details($data[0]);
            //$peza->set_invoice("78888");
            $peza->set_fullname(Auth::user()->name);


            return  $peza->send();
        } catch (\Exception $e) {
            return  $peza->send();
        }


    }

});



