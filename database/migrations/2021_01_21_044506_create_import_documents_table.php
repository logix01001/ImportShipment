<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateImportDocumentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('import_documents', function (Blueprint $table) {
            $table->id();
            $table->string('document_code',50);
            $table->string('bl_number',50);
            $table->date('document_received_date');
            $table->string('document_received_time',30);
            $table->date('processing_date')->nullable();
            $table->string('processing_time',30)->nullable();
            $table->string('sps_ic_number',30)->nullable();
            $table->string('factory_code',30);
            $table->string('shipping_company_code_fk',30);
            $table->date('estimated_time_arrival')->nullable();
            $table->date('actual_time_arrival')->nullable();
            $table->string('pod',20)->nullable();
            $table->string('registry_no',30)->nullable();
            $table->string('source_details',30)->nullable();
            $table->string('credit_line',30)->nullable();
            $table->string('prepaid',30)->nullable();
            $table->date('billing_request_date')->nullable();
            $table->date('billing_received_date')->nullable();
            $table->date('coordinator_payment_date')->nullable();
            $table->string('coordinator_remarks',50)->nullable();
            $table->date('endorse_date')->nullable();
            $table->date('cro_received_date')->nullable();
            $table->date('cro_validity')->nullable();
            $table->string('remarks_others',100)->nullable();
            $table->softdeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('import_documents');
    }
}
