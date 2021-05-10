import Access from './Access';
import ArrivalDocs from '../ImportDocument/ArrivalDocs';

export default class CoordinatorAccess extends Access {

    public constructor()
    {
        super()

        this.accessLists = [

            { text:"Credit line", value: "credit_line",type:"text"},
            { text:"Terms of payment", value: "prepaid",type:"select"},
            { text:"Billing request date", value: "billing_request_date",type:"datepicker"},
            { text:"Billing received date", value: "billing_received_date",type:"datepicker"},
            { text:"Coordinator payment date", value: "coordinator_payment_date",type:"datepicker"},
           // { text:"Coordinator remarks", value: "coordinator_remarks",type:"text"},
            { text:"Other remarks", value: "remarks_others",type:"text"},


            // "processing_date",
            // "processing_time",
            // "sps_ic_number",
            // "endorse_date",
            // "cro_received_date",
            // "cro_validity",
        ]
        this.setDocs(new ArrivalDocs)
    }
}
