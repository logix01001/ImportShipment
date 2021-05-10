import IimportDocument from '../interface/IimportDocument';
import AxiosCon from '../../AxiosCon'
import basepath from '../../basepath'
export default class newRecord
{

    public formObj : IimportDocument

    public constructor(){

        this.formObj = {
            bl_number: '',
            shipping_line_code: '',
            consignee: '',
            document_received_date : '',
            document_received_time: '',
            sps_ic_number: ''
        }
        // this.formObj = ({bl_number: '',shipping_line_code: '',consignee: '', document_received_date: '',document_received_time: ''} as IimportDocument)
    }

    public submit()
    {
        return AxiosCon.post('new_record',{ data: this.formObj})
    }

    public resetForm()
    {
        this.formObj = {
            bl_number: '',
            shipping_line_code: '',
            consignee: '',
            document_received_date : '',
            document_received_time: '',
            sps_ic_number: ''
        }
    }

}
