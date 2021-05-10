<?php

namespace App\Classfile;

use Illuminate\Support\Facades\DB;


trait GetDateRange
{


    /**
     * @param Array dateRange - getting range from and to [from,to]
     * @param string format - format of date output
     * ------------------------------------------------
     *  example [2020-01-01,2020-01-05]
     *  output
     *  [2020-01-01,2020-01-02......,2020-01-05]
     */

    public function getRange($dateRange,$format = "d-M-y")
    {

        $start = $dateRange[0];

        $end = isset($dateRange[1]) ? $dateRange[1] : $dateRange[0];

        $aryRange = [];

        $begin = new \DateTime( $start );
        $end = new \DateTime( $end );
        $end = $end->modify( '+1 day' );

        $interval = new \DateInterval('P1D');
        $daterange = new \DatePeriod($begin, $interval ,$end);

        foreach($daterange as $date){
            $aryRange[]  =  $date->format($format);
        }
        return  $aryRange;


    }

}
