import Access from './Access';
import LodgementDocs from '../ImportDocument/LodgementDocs';

export default class LodgementLeaderAccess extends Access {

    public constructor()
    {
        super()

        this.accessLists = [
            { text:"Target Lodgement", value: "target_lodgement_date",type:"datepicker"},
        ]

        this.setDocs(new LodgementDocs)
    }
}
