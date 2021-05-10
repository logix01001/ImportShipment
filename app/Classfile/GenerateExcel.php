<?php

namespace App\Classfile;

/**
 *  Trait to reuse the Array map
 */
trait GenerateExcel
{

    /**
     * @param GeneratedExcel $writer - Array data
     * @param string $file - filename
     * ------------------------------------------------
     * Header format to download generated xls
     */
    public function toExcel($writer,$file)
    {

        $writer->xlsWriter->writeToFile($file);
        if (file_exists($file)) {

            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="'.basename($file).'"');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($file));
            readfile($file);
            unlink($file);
            exit;

        }
    }
}
