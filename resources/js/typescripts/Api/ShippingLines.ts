import Api from "./Api";
import AxiosCon from '../../AxiosCon'
import basepath from '../../basepath'
export default class ShippingLines implements Api
{
    getApi()
    {
       return AxiosCon.get(`${basepath}api/shipping_lines`)

    }
}
