<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

//REQUEST ID  : SMD-SD-210417-224

class RemoveCoordinatorRemarksFromImportDocuments extends Migration
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
            $table->dropColumn("coordinator_remarks");
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
            $table->string('coordinator_remarks',50)->nullable()->after('coordinator_payment_date');
        });
    }
}
