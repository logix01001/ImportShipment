
import SendingEmail from './SendingEmail';
import AxiosCon from '../../AxiosCon'
import basepath from '../../basepath'


export default class PEZABOC implements SendingEmail
{

    public pezaid:number;
    public setId(pezaid:number) : this
    {

        this.pezaid = pezaid

        return this
    }


    public send()
    {
        return AxiosCon.get(`${basepath}sendEmail/${this.pezaid}`)
    }

}
