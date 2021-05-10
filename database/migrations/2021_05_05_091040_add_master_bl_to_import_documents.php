<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddMasterBlToImportDocuments extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('import_documents', function (Blueprint $table) {
            //
            $table->string('master_bl_number',50)->nullable()->after('bl_number');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('import_documents', function (Blueprint $table) {
            //
            $table->dropColumn('master_bl_number');
        });
    }
}
