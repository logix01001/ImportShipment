<?php

namespace Database\Factories;

use App\Classfile\IDoc;
use App\Models\ImportDocument;
use App\Models\MFactory;
use App\Models\ShippingLine;
use Illuminate\Database\Eloquent\Factories\Factory;

class ImportDocumentFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = ImportDocument::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $doc = new IDoc;
        $number = $this->faker->numberBetween(1,28);
        return [
            //
            "document_code" =>  $doc->generate(),
            "bl_number" => $this->faker->regexify('[A-Z0-9]{12}'),
            "factory_code" => MFactory::select('factory_code')->inRandomOrder()->first()->factory_code,
            "shipping_company_code_fk" => ShippingLine::select('shipping_company_code')->inRandomOrder()->first()->shipping_company_code,
            "document_received_date" => date('Y') . '-02-' . ( strlen($number) > 9 ? '0' . $number : $number),
            "document_received_time" => '08:00 AM'
        ];
    }
}
