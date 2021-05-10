<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDutiableToLodgementDetails extends Migration
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
            $table->float('dutiable',8,2)->nullable()->after('tsad_number');
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
            $table->dropColumn('dutiable',8,2);
        });
    }
}
