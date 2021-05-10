import Api from "./Api";
import AxiosCon from '../../AxiosCon'
import basepath from '../../basepath'
export default class Factories implements Api
{
    getApi()
    {
       return AxiosCon.get(`${basepath}api/factories`)

    }
}
