
import Element from "./Element";

export default class Button extends Element {

    public text:string
    public methodName:string

    public constructor(text,methodName)
    {
        super()
        this.text = text
        this.methodName = methodName
    }
    render()
    {
        return '<v-btn color="primary" @click="'+this.methodName+'">'+this.text+'</v-btn>'
    }

    // public getApi(apiObj:Api)
    // {
    //     if(this.selection.length == 0){
    //         apiObj.getApi()
    //         .then(res=>{
    //             this.selection = res.data
    //         }).catch(err=>{
    //             this.selection = []
    //         })
    //     }

    // }

}
