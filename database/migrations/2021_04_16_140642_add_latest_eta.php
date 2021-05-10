<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddLatestEta extends Migration
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
            $table->string('latest_estimated_time_arrival',30)->nullable()->after('actual_time_arrival');
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
            $table->dropColumn('latest_estimated_time_arrival');
        });
    }
}
