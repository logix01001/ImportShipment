<?php

namespace App\Http\Controllers;

use Exception;
use App\Models\User;
use Inertia\Inertia;
use App\Jobs\EditByJob;
use Illuminate\Http\Request;
use App\Classfile\ResponseStatus;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;

class SettingInchargeController extends Controller
{
    //

    public function inchargePage()
    {

        $permissions_lists = Permission::select('id','name')->get();
        $users = User::select('users.id','users.name as fullname','username','role_id','roles.name')
        ->leftJoin('model_has_roles','model_id','users.id')
        ->leftJoin('roles','roles.id','model_has_roles.role_id')
        ->with('permissions')
        ->get();
        $roles = Role::all();
        return Inertia::render('Settings/Incharge',['auth'=>Auth::user(),'permissions'=> Auth::user()->permissions,"permissions_lists"=>$permissions_lists,"users" => $users,"roles" =>  $roles]);
    }

    public function newuser(Request $request)
    {

        $validatedData = $request->validate([
            'name' => ['required','string'],
            'username' => ['required','string', 'unique:users'],
            'password' => ['required','string'],
        ]);

        if(  $validatedData ){
            try {
                //code...
                DB::beginTransaction();

                $user = new User;
                $user->name = $request->input('name');
                $user->username = $request->input('username');
                $user->password = Hash::make($request->input('password'));
                $user->save();
                $user->id;

                if( $request->input('role_name') != ''){
                    $user->assignRole($request->input('role_name'));
                }

                DB::commit();
            } catch (Exception $e) {
                DB::rollback();
                //throw $th;
            }
        }

    }

    public function saveRole(Request $request)
    {

        $user = User::find($request->input('user_id'));


        $permissions = $user->getAllPermissions();
        foreach($permissions as $permi){
            if(!in_array($permi['name'],$request->input('permissions'))){
                $user->revokePermissionTo($permi['name']);
            }
        }

        DB::table('model_has_roles')->where('model_id',$user->id)->delete();

        try {
            $user->givePermissionTo($request->input('permissions'));
            $user->assignRole($request->input('role_name'));

            return ResponseStatus::success($user->getAllPermissions());
        } catch (Exception $e) {
            return ResponseStatus::failed(["err"=>$e]);
        }







        //EditByJob::dispatch('Assign Role',["user_id" => $user->id],$request->input('role_name'));

    }
}
