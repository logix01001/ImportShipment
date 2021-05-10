<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddPezasentDateToLodgementDetails extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('lodgement_details', function (Blueprint $table) {
            //
            $table->dateTime('pezasent_date')->nullable()->after('pezasent_by');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('lodgement_details', function (Blueprint $table) {
            //
            $table->dropColumn('pezasent_date');
        });
    }
}
