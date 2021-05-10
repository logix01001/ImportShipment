import Access from './Access';
import ArrivalDocs from '../ImportDocument/ArrivalDocs';
import Docs from '../ImportDocument/Docs';

export default class ArrivalAccess extends Access {

    public constructor()
    {
        super()

        this.accessLists = [
            { text:"Document Received Date", value: "document_received_date" , type:"datepicker"},
            { text:"Document Received Time", value: "document_received_time", type:"text"},
            { text:"Processing date", value: "processing_date",type:"datepicker"},
            { text:"Processing time", value: "processing_time",type:"text"},
            { text:"SPS number", value: "sps_ic_number",type:"text"},
            // { text:"BL NUMBER", value: "bl_number"},
            { text:"Master BL", value: "master_bl_number",type:"text"},
            { text:"Factory Name", value: "factory_code",type:"select"},
            { text:"OBL", value: "obl",type:"select"},
            { text:"OBL Received Date", value: "obl_received_date",type:"datepicker"},
            { text:"Shipping Line Name", value: "shipping_company_code_fk",type:"select"},
            { text:"Forwarder", value: "forwarder",type:"text"},
            { text:"ETA", value: "estimated_time_arrival",type:"datepicker"},
            { text:"Source ETA", value: "source_eta",type:"text"},
            // { text:"ATA", value: "actual_time_arrival",type:"datepicker"},
            { text:"Latest ETA", value: "latest_estimated_time_arrival",type:"datepicker"},
            { text:"Port of Discharge", value: "pod",type:"select"},
            { text:"Registry Number", value: "registry_no",type:"text"},
            { text:"Connecting Vessel", value: "connecting_vessel",type:"text"},
            { text:"Source Details", value: "source_details",type:"text"},
            { text:"Transhipment port", value: "transhipment_port",type:"text"},
            { text:"Endorse date", value: "endorse_date",type:"datepicker"},
            { text:"CRO web date", value: "cro_web_date",type:"datepicker"},
            { text:"CRO received date", value: "cro_received_date",type:"datepicker"},
            { text:"CRO validity", value: "cro_validity",type:"datepicker"},
        ]

        this.setDocs(new ArrivalDocs)
    }
}
