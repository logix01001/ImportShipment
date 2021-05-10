import Access from './Access';
import LodgementDocs from '../ImportDocument/LodgementDocs';
import BOCDocs from '../ImportDocument/BOCDocs';
import IBocAccess from '../interface/IBocAccess';

export default class BOCAccess extends Access implements IBocAccess {

    BOCaccessLists : Array<{text:string,value:string,type:string}>

    public constructor()
    {
        super()

        this.accessLists = []

        this.BOCaccessLists = [
            { text:"OP Number", value: "op_number",type:"text"}
        ]

        this.setDocs(new BOCDocs)
    }
}
