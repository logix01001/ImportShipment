import Iusers from '../interface/Iusers';
import usergates from '../interface/usergates';
import Vue from 'vue';
import AxiosCon from '../../AxiosCon';
import basepath from '../../basepath';
export default class incharge
{
    public users : Iusers;
    public permission : usergates;
    public _permission : usergates;
    public _ : any;


    constructor( permission:usergates )
    {
        this.permission = permission;
        this._permission = permission;
        this.users = ({} as any)
        this._ = require('lodash')

    }

    setUser( users:Iusers )
    {
        this.users = users;
        this.permission = this._permission;
        this.matchPermission()
    }

    matchPermission()
    {

        if(this.users.hasOwnProperty('permissions')){
            let myAccess = this._.map( this.users.permissions , 'name');
            this._.forEach( this.permission, function(o) {
                if(myAccess.includes(o.name)){

                    Vue.set(o,'value',true)

                }else{

                    Vue.set(o,'value',false)
                }
            });
        }else{
            this._.forEach( this.permission, function(o) {
                Vue.set(o,'value',false)
            });
        }


    }
    permissionEvent(id,value){
        console.log(this._.find( this.permission, function(o) { return o.id == id; }))
        this._.find( this.permission, function(o) { return o.id == id; }).value = value;

    }
    save()
    {
        AxiosCon.put(`${basepath}user_incharge/${this.users.id}`,
        this._.filter(this.permission,['value', true])
        )
        .then(res => {
            console.log(res)
        })
        .catch(err => {
            console.error(err);
        })
    }
}
