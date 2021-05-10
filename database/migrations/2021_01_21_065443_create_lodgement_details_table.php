<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLodgementDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lodgement_details', function (Blueprint $table) {
            $table->id();
            $table->string('document_code_fk',50);
            $table->boolean('is_document_received_processing')->default(false);
            $table->date('document_received_processing_date')->nullable();
            $table->string('document_received_processing_by',30)->nullable();
            $table->date('target_lodgement_date')->nullable();
            $table->string('document_status',30)->nullable();
            $table->date('ip_date')->nullable();
            $table->date('e2m_date')->nullable();
            $table->date('ip_checked_date')->nullable();
            $table->date('e2m_checked_date')->nullable();
            $table->date('ip_approval_date')->nullable();
            $table->date('e2m_approval_date')->nullable();
            $table->string('ip_number',30)->nullable();
            $table->string('tsad_number',30)->nullable();
            $table->date('turnover_process_date')->nullable();
            $table->string('remarks_tag',100)->nullable();
            $table->string('ip_lodgement_incharge',30)->nullable();
            $table->string('e2m_lodgement_incharge',30)->nullable();
            $table->integer('invoice_item_number')->default(1);
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
        Schema::dropIfExists('lodgement_details');
    }
}
