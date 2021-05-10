<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddIsSentEmailToLodgementDetails extends Migration
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
            $table->boolean('is_pezasent')->default(false)->after('e2m_lodgement_incharge');
            $table->string('pezasent_by')->nullable()->after('is_pezasent');
            $table->date('pezasent_date')->nullable()->after('pezasent_by');
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
            $table->dropColumn('is_pezasent');
            $table->dropColumn('pezasent_by');
            $table->dropColumn('pezasent_date');
        });
    }
}
