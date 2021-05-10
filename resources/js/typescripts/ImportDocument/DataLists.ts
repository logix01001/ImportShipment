import AxiosCon from '../../AxiosCon'
import basepath from '../../basepath'
export default class DataLists
{

    public generate()
    {
        return AxiosCon.post(basepath + 'documents')
    }

}
