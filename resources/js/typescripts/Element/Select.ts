import Api from "../Api/Api";
import ApiPoly from "../Api/ApiPoly";
import Factories from '../Api/Factories';
import Element from "./Element";

export default class Select extends Element {

    public selection:Array<object>
    public text:string
    public value:string

    public constructor(text,value)
    {
        super()
        this.text = text
        this.value = value
    }
    render()
    {
        return '<v-select v-model="this.value" :item="selectionLists" dense></v-select>{{selectionLists}}'
        // return `
        // <Select>
        //     <Option v-for="sl in selectionLists" :key="sl.id" :value="sl.${this.value}">{{sl.${this.text}}}</Option>
        // </Select>`
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
