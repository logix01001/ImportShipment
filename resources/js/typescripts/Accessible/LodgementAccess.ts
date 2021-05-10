import Access from './Access';
import LodgementDocs from '../ImportDocument/LodgementDocs';

export default class LodgementAccess extends Access {

    public constructor()
    {
        super()

        this.accessLists = [
            // { text:"Received from docs", value: "is_received",type:"checkbox"},
            { text:"Status", value: "document_status",type:"select"},
            { text:"IP created date", value: "ip_date",type:"datepicker"},
            { text:"E2M created date ", value: "e2m_date",type:"datepicker"},
            { text:"IP checked date ", value: "ip_checked_date",type:"datepicker"},
            { text:"E2M checked date ", value: "e2m_checked_date",type:"datepicker"},
            { text:"IP approval date ", value: "ip_approval_date",type:"datepicker"},
            { text:"IP no", value: "ip_number",type:"text"},
            { text:"E2M approval date", value: "e2m_approval_date",type:"datepicker"},
            { text:"Tsad no", value: "tsad_number",type:"text"},
            { text:"Dutiable", value: "dutiable",type:"text"},
            { text:"Turnover date", value: "turnover_process_date",type:"datepicker"},
            { text:"Volume & Size", value: "volume",type:"special"},
            { text:"Remarks", value: "remarks_tag",type:"text"},
            { text:"Tag", value: "assessment_tag",type:"select"},
            // { text:"IP Lodgement incharge", value: "ip_lodgement_incharge",type:"checkbox"},
            // { text:"E2M Lodgement incharge", value: "e2m_lodgement_incharge",type:"checkbox"},
        ]

        this.setDocs(new LodgementDocs)
    }
}
