<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;

class PermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Permission::create(['name' => 'monitoring-create']);
        Permission::create(['name' => 'monitoring-update']);
        Permission::create(['name' => 'monitoring-delete']);
        Permission::create(['name' => 'lodgement-create']);
        Permission::create(['name' => 'lodgement-update']);
        Permission::create(['name' => 'lodgement-delete']);
        Permission::create(['name' => 'leader-create']);
        Permission::create(['name' => 'leader-update']);
        Permission::create(['name' => 'leader-delete']);
        Permission::create(['name' => 'coordinator-create']);
        Permission::create(['name' => 'coordinator-update']);
        Permission::create(['name' => 'coordinator-delete']);
    }
}
