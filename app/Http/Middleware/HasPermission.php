<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class HasPermission
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next,$permissions = [])
    {
        $permissions_array = explode('|', $permissions);
        foreach($permissions_array as $permission){
            if (!$request->user()->hasPermissionTo($permission)){
                return redirect()->back();
            }
        }
        return $next($request);
    }
}
