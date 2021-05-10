<?php

namespace App\Models;

use App\Classfile\HasColumnLists;
use App\Classfile\HasUpdatetableColumn;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Classfile\ImportDocument as ClassfileImportDocument;

class LodgementDetail extends Model implements Auditable
{
    use HasFactory;
    use HasColumnLists;
    use HasUpdatetableColumn;
    use \OwenIt\Auditing\Auditable;



    protected $fillable = ['is_pezasent','pezasent_by','pezasent_date'];

    public static function getDetailsEmail($id)
    {
        return self::select('bl_number','import_documents.id as impid','import_documents.factory_code','factory_abbr','factory_name','import_documents.shipping_company_code_fk','lodgement_details.id as lodgid','pod','turnover_process_date','tsad_number','ip_number')
                    ->join('import_documents','document_code_fk','document_code')
                    ->leftJoin('m_factories','m_factories.factory_code','import_documents.factory_code')
                    ->leftJoin('shipping_lines','shipping_lines.shipping_company_code','import_documents.shipping_company_code_fk')

                    ->orderBy('m_factories.factory_code','ASC')
                    ->where('import_documents.id',$id)
                    ->get();

    }

    //ACCESSOR



    public function getDocumentReceivedProcessingDateAttribute($value)
    {
        return $this->nullableValue($value);
    }
    public function getIsReceivedDateAttribute($value)
    {
        return $this->nullableValue($value);
    }

    /*
        'import_documents.id as impd_id',
            'lodgement_details.id as lodged_id',
            'document_code',
            'bl_number',
            'document_received_date',
            'document_received_time',
            'm_factories.factory_code',
            'factory_abbr',
            'shipping_lines.shipping_company_code',
            'shipping_lines.shipping_company_name',
            'estimated_time_arrival',
            'actual_time_arrival',
            'pod',
            'registry_no',
            'connecting_vessel',
            'source_details',
            'lodgement_details.is_document_received_processing as is_received',
            'lodgement_details.document_received_processing_date as is_received_date',
            'lodgement_details.document_received_processing_by as is_received_by',
            'lodgement_details.target_lodgement_date',
            'lodgement_details.document_status',
            'lodgement_details.ip_date',
            'lodgement_details.e2m_date',
            'lodgement_details.ip_checked_date',
            'lodgement_details.e2m_checked_date',
            'lodgement_details.ip_approval_date',
            'lodgement_details.e2m_approval_date',
            'lodgement_details.ip_number',
            'lodgement_details.tsad_number',
            'lodgement_details.turnover_process_date',
            'lodgement_details.remarks_tag',
            'lodgement_details.ip_lodgement_incharge',
            'lodgement_details.e2m_lodgement_incharge',
            'lodgement_details.invoice_item_number',
    */
}
