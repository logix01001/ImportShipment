<?php

namespace App\Classfile\Excel;

/**
 *  Trait to reuse the Array map
 */
trait TContainerFormattable
{

    public function rowheader($header)
    {
        $data = [];

        foreach(array_keys($header) as $header){
            $data[] = $header;
            if($header == 'NO. OF CONTAINERS'){
                $data[] = "";
            }
        }
        return $data;
    }

    public function checkzero($s20,$s40,$type = true)
    {
        $result = '';
        if($type){

            if($s20 > 0){
                $result .= $s20;
            }

            if($s40 > 0)
            {
                if($result == ''){
                    $result .= $s40;
                }else
                {
                    $result .= " , $s40";
                }

            }
        }
        else{
            if($s20 > 0){
                $result .= "20";
            }

            if($s40 > 0)
            {
                if($result == ''){
                    $result .= "40";
                }else
                {
                    $result .= " , 40";
                }

            }
        }

        return $result;
    }
}
