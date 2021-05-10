import Access from './Access';
import MasterArrivalDocs from '../ImportDocument/MasterArrivalDocs';
import ArrivalAccess from './ArrivalAccess';
import CoordinatorAccess from './CoordinatorAccess';
import UrgentMonitoringAccess from './UrgentMonitoringAccess';

export default class MasterArrivalAccess extends Access {

    public constructor()
    {
        super()

        // this.accessLists = [
        //     { text:"Document Received Date", value: "document_received_date" , type:"datepicker"},
        //     { text:"Document Received Time", value: "document_received_time", type:"text"},
        //     // { text:"BL NUMBER", value: "bl_number"},
        //     { text:"Factory Name", value: "factory_code",type:"select"},
        //     { text:"Shipping Line Name", value: "shipping_company_code_fk",type:"select"},
        //     { text:"ETA", value: "estimated_time_arrival",type:"datepicker"},
        //     { text:"ATA", value: "actual_time_arrival",type:"datepicker"},
        //     { text:"Port of Discharge", value: "pod",type:"select"},
        //     { text:"Registry Number", value: "registry_no",type:"text"},
        //     { text:"Connecting Vessel", value: "connecting_vessel",type:"text"},
        //     { text:"Source Details", value: "source_details",type:"text"},
        // ]
        var ArrivalAccessObj = new ArrivalAccess
        var UrgentMonitoringAccessObj = new UrgentMonitoringAccess
        var CoordinatorAccessObj = new CoordinatorAccess

        this.accessLists = [
            ...UrgentMonitoringAccessObj.accessLists,
            ...ArrivalAccessObj.accessLists,
            ...CoordinatorAccessObj.accessLists

        ];
        this.setDocs(new MasterArrivalDocs)
    }
}
