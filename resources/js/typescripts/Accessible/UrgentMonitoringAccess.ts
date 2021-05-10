import Access from './Access';
import ArrivalDocs from '../ImportDocument/ArrivalDocs';


export default class UrgentMonitoringAccess extends Access {

    public constructor()
    {
        super()

        this.accessLists = [
            { text:"Shipment Priority", value: "shipment_priority",type:"select"},
        ]

        this.setDocs(new ArrivalDocs)
    }
}
