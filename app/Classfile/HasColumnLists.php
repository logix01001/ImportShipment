<?php

namespace App\Classfile;

use Illuminate\Support\Facades\DB;

/**
 *  Trait to reuse the Array map
 */
trait  HasColumnLists
{

   public static function getColumnLists()
   {
        $currentModel = new self;

        $table = $currentModel->getTable();

        $columns = DB::getSchemaBuilder()->getColumnListing($table);

        return $columns;
   }
}
