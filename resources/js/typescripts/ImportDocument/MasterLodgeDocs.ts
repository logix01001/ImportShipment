import Docs from './Docs';
import LodgementDocs from './LodgementDocs';
export default class MasterLodgeDocs extends Docs
{

    public constructor()
    {
        super();
        var LodgementDocsObj = new LodgementDocs;
        this.docType = LodgementDocsObj.docType
        this.columns = LodgementDocsObj.columns;
    }

}

