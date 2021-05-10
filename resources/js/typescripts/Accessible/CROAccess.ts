import Access from './Access';
import ArrivalDocs from '../ImportDocument/ArrivalDocs';

export default class CROAccess extends Access {

    public constructor()
    {
        super()

        this.accessLists = [

            // "credit_line",
            // "prepaid",
            // "billing_request_date",
            // "billing_received_date",
            // "coordinator_payment_date",
            // "coordinator_remarks",
            // "remarks_others",
        ]


        this.setDocs(new ArrivalDocs)
    }
}
