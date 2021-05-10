
import Docs from '../ImportDocument/Docs';

export default abstract class Access
{
    public accessLists : Array<{text:string,value:string,type:string}>
    public document : Docs

    public constructor()
    {
        this.document = null
    }
    public setDocs( docs:Docs)
    {
        this.document = docs
    }

}
