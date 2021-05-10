import Access from './Accessible/Access'
import ArrivalAccess from './Accessible/ArrivalAccess';
import CoordinatorAccess from './Accessible/CoordinatorAccess';
import CROAccess from './Accessible/CROAccess';
import AxiosCon from '../AxiosCon'
import basepath from '../basepath'
import LodgementAccess from './Accessible/LodgementAccess';
import LodgementLeaderAccess from './Accessible/LodgementLeaderAccess';
import BOCAccess from './Accessible/BOCAccess';
import Docs from './ImportDocument/Docs';
import UrgentMonitoringAccess from './Accessible/UrgentMonitoringAccess';
import MasterArrivalAccess from './Accessible/MasterArrivalAccess';
import MasterLodgeAccess from './Accessible/MasterLodgeAccess';
export default class MyDocument
{
    public MyAccess : Access

    public constructor(roletype:string)
    {
        switch(roletype.toUpperCase()){
            case 'ARRIVAL UPDATE':
                this.MyAccess = new ArrivalAccess;
                break;
            case 'COORDINATOR':
                this.MyAccess = new CoordinatorAccess;
                break;
            case 'CRO MONITORING':
                this.MyAccess = new CROAccess;
                break;
            case 'LODGEMENT':
                this.MyAccess = new LodgementAccess;
                break;
            case 'LODGEMENT LEADER':
                this.MyAccess = new LodgementLeaderAccess;
                break;
            case 'URGENT MONITORING':
                this.MyAccess = new UrgentMonitoringAccess;
                break;
            case 'MANILA PROCESSOR':
                this.MyAccess = new BOCAccess;
                break;
            case 'MASTER':
                this.MyAccess = new MasterArrivalAccess;
                break;
        }
    }


    public setDocType(Document:Docs)
    {
        this.MyAccess.setDocs(Document)
    }

    public setDocTypeMaster(doctype:boolean)
    {
        this.MyAccess = doctype ? new MasterArrivalAccess : new MasterLodgeAccess;
    }
    public generateData(daterange:Array<string> = [])
    {
       return AxiosCon.post('/documents',
        {
            doctype: this.MyAccess.document.docType,
            daterange: daterange,
        })
    }

    public generateDataBOC(daterange:Array<string> = [])
    {
       return AxiosCon.post('/bocDocuments',
        {
            daterange: daterange
        })
    }

    // DOCS ID , COLUMN , VALUE
    public updateData(docsID : Array<string> , column: string , value: any)
    {
        return AxiosCon.put('/updatedocument',
        {
            docsID: docsID,
            column: column,
            value: value
        })
    }

    // DOCS ID , COLUMN , volume
    public updateVolumeData(docsID : Array<string> , volume: any)
    {
        return AxiosCon.put('/volumedocument',
        {
            docsID: docsID,
            volume: volume
        })
    }


}
