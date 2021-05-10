
import Element from "./Element";

export default class Datepicker extends Element {

    public renderString: string;

    public constructor()
    {
        super()
    }
    render()
    {
        // return
        // '<v-menu'+
        //             ' v-model="dateM"' +
        //             ' :close-on-content-click="false"'+
        //             ' :nudge-right="40"'+
        //             ' transition="scale-transition"'+
        //             ' offset-y'+
        //             ' min-width="auto">'+
        //         '<template v-slot:activator="{ on, attrs }">'+
        //        ' <v-text-field'+
        //            ' v-model="updatevalue"'+
        //             ' label="From"'+
        //             ' readonly'+
        //            ' v-bind="attrs"'+
        //            ' v-on="on"'+
        //            ' dense'+
        //            ' hide-details="true"'+
        //            ' outlined'+
        //        ' ></v-text-field>'+
        //        ' </template>'+
        //        ' <v-date-picker'+
        //        ' v-model="updatevalue"'+
        //        ' @input="dateM = false"'+
        //        ' ></v-date-picker>'+
        //     '</v-menu>'


        return  `<v-menu v-model="dateM" :close-on-content-click="false" :nudge-right="40" transition="scale-transition" offset-y  min-width="auto"><template v-slot:activator="{ on, attrs }"><v-text-field v-model="value" label="Picker without buttons" prepend-icon="mdi-calendar" readonly v-bind="attrs" v-on="on"></v-text-field></template><v-date-picker v-model="value" @input="dateM = false"></v-date-picker></v-menu> {{  dateM }} {{  value }}`
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
