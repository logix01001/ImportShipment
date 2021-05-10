import Docs from './Docs';
import ArrivalDocs from './ArrivalDocs';
export default class MasterArrivalDocs extends Docs
{

    public constructor()
    {
        super();
        var ArrivalDocsObj = new ArrivalDocs;
        this.docType = ArrivalDocsObj.docType
        this.columns = ArrivalDocsObj.columns;
    }

}

