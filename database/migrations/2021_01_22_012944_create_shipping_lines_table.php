<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateShippingLinesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shipping_lines', function (Blueprint $table) {
            $table->id();
            $table->string('shipping_company_code',20);
            $table->string('shipping_company_name',50);
            $table->string('invoice_mk',10);
            $table->timestamps();
            $table->softDeletes();
            $table->string('deleted_by',30)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('shipping_lines');
    }
}
