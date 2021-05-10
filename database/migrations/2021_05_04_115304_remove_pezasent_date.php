<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RemovePezasentDate extends Migration
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
            $table->dropColumn('pezasent_date');
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
            $table->date('pezasent_date')->nullable()->after('pezasent_by');
        });
    }
}
