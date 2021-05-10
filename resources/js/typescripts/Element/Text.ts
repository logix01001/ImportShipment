
import Element from "./Element";

export default class Text extends Element {



    public constructor()
    {
        super()
    }
    render()
    {
        return '<v-text-field v-model="value" outlined dense hide-details></v-text-field>'

    }


}
