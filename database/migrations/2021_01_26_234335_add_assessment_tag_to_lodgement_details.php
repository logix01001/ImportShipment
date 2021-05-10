<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddAssessmentTagToLodgementDetails extends Migration
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
            $table->string('assessment_tag',20)->after('remarks_tag')->nullable();
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
            $table->dropColumn('assessment_tag');
        });
    }
}
