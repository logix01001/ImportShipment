export default class More1Day
{


    public checkDate(startdate:any , enddate:any = null){
        var now:any;

        if(enddate == null){
            now = new Date();
        }else{
            now = new Date(enddate);
        }


        // This is returned as: July 18, 2018 at 3:48:00 AM UTC+1
        startdate = new Date( startdate )

        const oneDay = 60 * 60 * 24;

        var compareDatesBoolean = (now - startdate) > oneDay;

        return compareDatesBoolean;
    }
}
