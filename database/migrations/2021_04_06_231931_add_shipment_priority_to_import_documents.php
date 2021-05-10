<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddShipmentPriorityToImportDocuments extends Migration
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
            $table->boolean('shipment_priority')->default(false)->after('bl_number');
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
            $table->dropColumn('shipment_priority');
        });
    }
}
