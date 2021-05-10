<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMFactoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_factories', function (Blueprint $table) {

            $table->id();
            $table->string('factory_code',20);
            $table->string('factory_abbr',20);
            $table->string('factory_name',50);
            $table->timestamps();
            $table->softDeletes();
            $table->string('deleted_by',20)->nullable();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_factories');
    }
}
