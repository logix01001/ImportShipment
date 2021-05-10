<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddTranshipmentPortToImportDocuments extends Migration
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
            $table->string('transhipment_port',50)->nullable()->after('source_details');
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
            $table->dropColumn('transhipment_port');
        });
    }
}
