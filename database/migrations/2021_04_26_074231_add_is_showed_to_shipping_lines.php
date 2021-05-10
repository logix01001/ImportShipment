<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddIsShowedToShippingLines extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('shipping_lines', function (Blueprint $table) {
            //
            $table->boolean('is_showed')->default(false)->after('invoice_mk');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('shipping_lines', function (Blueprint $table) {
            //
            $table->dropColumn('is_showed');
        });
    }
}
