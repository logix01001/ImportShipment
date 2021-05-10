<?php

namespace Database\Seeders;

use App\Models\ImportDocument;
use App\Models\LodgementDetail;
use Illuminate\Database\Seeder;

class ImportDocumentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //

            ImportDocument::factory()
                            ->count(50)
                            ->create()
                            ->each(function ($customer) {
                                 LodgementDetail::insert(['document_code_fk'=>$customer->document_code]);
                            });
    }
}
