<?php

namespace App\Http\Controllers;

use App\Classfile\ArrayMap as ClassfileArrayMap;
use App\Models\User;
use ArrayMap;
use Illuminate\Http\Request;

use Spatie\Permission\Models\Permission;


class InchargeResource extends Controller
{

    use ClassfileArrayMap;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
     *
     */
    public function update(Request $request, $id)
    {
        //
        $user = User::find($id);
        $permissionsown = $user->getAllPermissions();
        $permissionsRequest = $request->input();

        $pReq = $this->map($permissionsRequest,'name');

        if(count($permissionsown) > 0){

            foreach($permissionsown as $pown)
            {
                $key = array_search($pown->id, array_column($permissionsRequest, 'id'));
                if($key == false){
                    $user->revokePermissionTo($pown->name);
                }
            }
        }

        $user->givePermissionTo($pReq);

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
