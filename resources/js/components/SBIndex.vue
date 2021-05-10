<template>
    <div v-if="myRole != ''">

        <v-row>
            <v-col>
                    <v-btn
                    depressed
                    color="primary"
                    fill
                    @click="open('newrecord')"
                    block
                    v-if="(myRole == 'ARRIVAL UPDATE' || myRole == 'MASTER') && !isFiltered"
                    >
                    New Record
                    </v-btn>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                    <v-btn
                    depressed
                    color="success"
                    fill
                    @click="open('bocextract')"
                    block
                    v-if="(myRole == 'ARRIVAL UPDATE' || myRole == 'MASTER') && !isFiltered"
                    >
                    Extraction
                    </v-btn>
            </v-col>

        </v-row>
        <div v-if="isFiltered">

            <v-row
                v-if="myRole == 'MASTER'"
                justify="start">
                <v-col
                cols="10">
                    Document :
                    <a-switch checked-children="Arrival" un-checked-children="Lodgement" @change="updateDocType" default-checked />

                </v-col>
            </v-row>
            <v-divider></v-divider>
            <v-row
                justify="start">
                <v-col
                cols="12">
                    <v-label><b>Filter By : </b></v-label>
                    <v-select
                    :items="accessDateList"
                    item-value="value"
                    item-text="text"
                    dense
                    outlined
                    clearable
                    hide-details="true"
                    v-model="select_filter"
                    :disabled="filterRange"
                    >
                    </v-select>

                </v-col>
             </v-row>
            <v-row>
                <v-col>
                    <a-range-picker  :disabled="filterRange" valueFormat="YYYY-MM-DD" format="YYYY-MM-DD" v-model="daterange">
                        <template slot="dateRender"  slot-scope="current">
                            <div class="ant-calendar-date" :style="getCurrentStyle(current)">
                            {{ current.date() }}
                            </div>
                        </template>
                    </a-range-picker>

                </v-col>
            </v-row>

            <v-row>
                <v-col>
                    <v-btn color="success" v-if="!filterRange" @click="setFilter" block>Filter</v-btn>
                    <v-btn block v-if="filterRange" @click="resetFilterRange"> Reset Filter</v-btn>
                </v-col>

            </v-row>

            <v-row v-if="selectedRows > 0">
                <v-col>
                    <v-label><b>Update : </b></v-label>
                    <v-divider></v-divider>
                    Affected Row(s) : {{ selectedRows }}
                    <br>
                    <v-select

                        :items="itemsAccessSort"
                        label="Update Column"
                        item-value="value"
                        item-text="text"
                        dense
                        outlined

                        hide-details="true"
                        v-model="select_column"
                        @change="selectColumn(select_column)"
                        >

                    </v-select>
                    <!-- RENDER -->
                    <br>
                        <v-text-field
                                v-model="updatevalue"
                                label="Update to"
                                dense
                                hide-details="true"
                                outlined
                                v-if="selectedElement == 'text'"
                        ></v-text-field>
                        <v-select
                            v-if="selectedElement == 'select'"
                            :items="selectionLists.lists"
                            label="Update to"
                            :item-value="selectionLists.value"
                            :item-text="selectionLists.text"
                            dense
                            outlined
                            clearable
                            hide-details="true"
                            v-model="updatevalue"
                            >
                        </v-select>


                        <a-date-picker
                        size="large"
                        v-if="selectedElement == 'datepicker'"
                        format="YYYY-MM-DD"
                        valueFormat="YYYY-MM-DD"
                        v-model="updatevalue"
                        />
                        <br>
                        <!-- <v-menu
                            v-if="selectedElement == 'datepicker'"
                            v-model="dateM"
                            :close-on-content-click="false"
                            :nudge-right="40"
                            transition="scale-transition"
                            offset-y
                            min-width="auto"
                        >
                            <template v-slot:activator="{ on, attrs }">
                            <v-text-field
                                v-model="updatevalue"
                                label="Update to"
                                readonly
                                v-bind="attrs"
                                v-on="on"
                                outlined
                                hide-details=""
                                dense
                            ></v-text-field>
                            </template>
                            <v-date-picker
                            v-model="updatevalue"
                            @input="dateM = false"
                            ></v-date-picker>
                        </v-menu> -->
                        <!-- <center v-if="selectedElement == 'checkbox'">

                            <a-checkbox   v-model="updatevalue">
                            </a-checkbox>
                            <span v-if="selectedObj.value == 'is_received'">
                                Received Document
                            </span>
                            <span v-if="selectedObj.value == 'ip_lodgement_incharge'">
                                set ME as ip lodgement Incharge
                            </span>
                            <span v-if="selectedObj.value == 'e2m_lodgement_incharge'">
                                set ME as E2M lodgement Incharge
                            </span>


                        </center> -->
                        <!-- {{ selectedObj }} -->

                        <center v-if="selectedElement == 'special'">
                            <div v-if="selectedObj.value == 'volume'">
                                <v-row>
                                    <v-col>
                                        <v-text-field
                                        v-model="volume.size_20"
                                        label="qty for 20"
                                        dense
                                        hide-details="true"
                                        outlined></v-text-field>
                                    </v-col>
                                    <v-col>
                                        <v-text-field
                                        v-model="volume.size_40"
                                        label="qty for 40"
                                        dense
                                        hide-details="true"
                                        outlined></v-text-field>
                                    </v-col>
                                </v-row>
                            </div>
                        </center>


                        <!-- ANOTHER CASE IF SELECTED IS FORWARDER ADD NEW BUTTON FOR NO FORWARDER -->
                        <!-- NO FORWARDER -->
                        <center>
                            <v-btn
                                v-if="selectedElement == 'text' && selectedObj.value == 'forwarder'"
                                @click="noForwarder"
                                color="primary"
                                small
                            >
                            SET NO FORWARDER
                            </v-btn>
                        </center>
                    <!-- RENDER -->
                    <br>
                    <v-btn color="warning" v-if="selectedElement != 'special'" @click="updateValue(updatevalue)" block>Update</v-btn>

                    <v-btn color="warning" v-if="selectedElement == 'special' && selectedObj.value == 'volume'" @click="updateValueVolume(volume)"  block>Update</v-btn>
                </v-col>
            </v-row>
            <v-row v-if="isFiltered">
                <v-col>
                    <v-divider></v-divider>
                    <v-btn
                        depressed
                        color="info"
                        fill
                        @click="resetDateSelected"
                        bottom
                        block>
                        Reset data
                        </v-btn>
                </v-col>
            </v-row>
        </div>
    </div>
</template>

<script>
import { mapActions, mapState } from 'vuex';
import Factories from '../typescripts/Api/Factories';
import _ from 'lodash';
import ShippingLines from '../typescripts/Api/ShippingLines';
import LocalPayments from '../typescripts/Api/LocalPayments';

import { getCurrentStyle } from '@/js/const/daterange'

// import { Select } from 'antd';
export default {
    props:
    {
        auth: Object
    },
    data(){
        return {
            selectedObj: {},
            dateM: false,
            selectedElement : '',
            volume: {
                size_20: 0,
                size_40: 0,
            },
            h1: '<h1>test</h1>',

            //REFACTOR MASTER MAINTENANCE
            document_status: [
                {text:'FOR APPROVAL',name:'FOR APPROVAL'},
                {text:'FOR CHECKSEND',name:'FOR CHECKSEND'},
                {text:'FOR LODGE',name:'FOR LODGE'},
                {text:'FOR LODGE (DUTIES)',name:'FOR LODGE (DUTIES)'},
                {text:'FOR LODGE / MANY ITEMS',name:'FOR LODGE / MANY ITEMS'},
                {text:'FOR PORTAL',name:'FOR PORTAL'},
                {text:'IP SENT',name:'IP SENT'},
                {text:'MANY ITEMS (FOR SPECIFY)',name:'MANY ITEMS (FOR SPECIFY)'},
                {text:'WAITING FOR DETAILS',name:'WAITING FOR DETAILS'},
                {text:'WRONG BL',name:'WRONG BL'},
            ],
            //----------------------------

            //REFACTOR MASTER MAINTENANCE
            assessment_tag: [
                {text:'YELLOW',name:'YELLOW'},
                {text:'ORANGE',name:'ORANGE'},
                {text:'RED',name:'RED'}
            ],
            //----------------------------

            //REFACTOR MASTER MAINTENANCE
            localpayments: [
                {text:'CASH',name:'CASH'},
                {text:'CHECK',name:'CHECK'},
                {text:'FREE',name:'FREE'}
            ],
            //----------------------------

            shipment_priority: [
                {text:'URGENT SHIPMENT',name:1},
                {text:'',name:0},
            ],

            obltype: [
                {text:'WITH OBL',name:'WITH OBL'},
                {text:'',name:''},
            ],
            updatevalue: '',
            daterange: [],
            filterRange: false,
            columnSelection:[

            ],
            ApiFactories: new Factories,
            ApiShippingLines: new ShippingLines,
            ApiLocalPayments: new LocalPayments,
            factories: [],
            shippingLines: [],
            pod_list: [{name : 'SOUTH'},{name:'NORTH'}],
            selectionLists: {
                lists: [],
                text: '',
                value: '',
            },
            range: {
                from: null,
                to: null,
            },
            fromM: false,
            toM: false,
            select_column: '',
            select_filter: '',
            itemsAccessSort: []
        }
    },
    watch:{
        columnAccessLists(val)
        {
            //SORTING UPDATE COLUMN
            this.itemsAccessSort = _.sortBy(val, ['text']);
        },
        select_column(val)
        {
            let obj = _.find(this.columnAccessLists,{value: val})
            this.selectedElement = ''
            this.updatevalue = ''
            this.volume.size_20 = 0
            this.volume.size_40 = 0
            this.selectedObj = obj
            switch(obj.type)
            {

                case 'special' :
                    this.selectedElement = 'special'
                    this.updatevalue = true
                    break;
                case 'checkbox' :
                    this.selectedElement = 'checkbox'
                    this.updatevalue = true
                    break;
                case 'text' :
                    this.selectedElement = 'text'
                    break;
                case 'datepicker' :
                    this.selectedElement = 'datepicker'
                    break;
                case 'select' :
                    this.selectedElement = 'select'

                    switch(obj.value)
                    {
                        case 'factory_code' :
                            this.selectionLists = {
                                lists: this.factories,
                                text: 'factory_abbr',
                                value: 'factory_code',
                            }
                            break;
                        case 'shipping_company_code_fk' :
                            this.selectionLists = {
                                lists: this.shippingLines,
                                text: 'shipping_company_name',
                                value: 'shipping_company_code',
                            }
                            break;
                        case 'pod' :
                            this.selectionLists = {
                                lists: this.pod_list,
                                text: 'name',
                                value: 'name',
                            }
                            break;
                        case 'shipment_priority' :
                            this.selectionLists = {
                                lists: this.shipment_priority,
                                text: 'text',
                                value: 'name',
                            }
                            this.updatevalue = 0;
                            break;
                        case 'document_status' :
                            this.selectionLists = {
                                lists: this.document_status,
                                text: 'name',
                                value: 'name',
                            }
                            break;
                        case 'assessment_tag' :
                            this.selectionLists = {
                                lists: this.assessment_tag,
                                text: 'name',
                                value: 'name',
                            }

                            break;
                        case 'prepaid' :
                            this.selectionLists = {
                                lists: this.localpayments,
                                text: 'name',
                                value: 'name',
                            }
                            break;
                        case 'obl' :
                            this.selectionLists = {
                                lists: this.obltype,
                                text: 'name',
                                value: 'name',
                            }
                            break;
                    }
                    // if(obj.value == 'factory_code'){

                    // }

                    // if(obj.value == 'shipping_company_code_fk'){

                    // }

                    // if(obj.value == 'pod'){

                    // }

                    // if(obj.value == 'document_status'){

                    // }

                    // if(obj.value == 'assessment_tag'){

                    // }


                    // break;


            }

        },
        select_filter(val)
        {
            console.log(val)
        }
    },
    methods:{
        ...mapActions('storeHomeIndex',['selectColumn','updateValue','updateValueVolume','updateFilter','resetFilter','updateDocType']),
        ...mapActions('storeModal',['open',]),
        ...mapActions('storeDateSelected',['resetDateSelected']),
        getCurrentStyle,
        noForwarder()
        {
            this.updateValue("NO FORWARDER")
        },
        setFilter()
        {

            this.updateFilter({daterange: this.daterange,column:this.select_filter})
            this.filterRange = true
        },
        resetFilterRange()
        {
            this.filterRange = false
            this.resetFilter()
        },
        defaultApi()
        {
            var self = this

             this.ApiFactories.getApi()
            .then(res=>{
                self.factories = res.data
            })
            .catch(err=>{
                return err
            })

            this.ApiShippingLines.getApi()
            .then(res=>{
                self.shippingLines = res.data
            })
            .catch(err=>{
                return err
            })

            this.ApiLocalPayments.getApi()
            .then(res=>{
                self.localpayments = res.data
            })
            .catch(err=>{
                return err
            })

        }


    },
    computed:{

        ...mapState('storeHomeIndex',['myRole','selectedColumn','selectedRows','columnAccessLists','columnShownLists','selectedColumnFilter','daterangeFilter','documentType']),
        ...mapState('storeDateSelected',['isFiltered','dateFrom','dateTo']),
        accessDateList()
        {

            //SORTING FILTER BY
            return _.sortBy(_.map(_.filter(this.columnShownLists, {typecolumn:'datepicker'}), (o)=>{
                return {text: o.title, value: o.typevalue}
            }),['text'])
        }


    },
//     beforeMount()
//     {
// this.selectedObj = 'DatepickerObj'
//                     this.selectedElement = true
//     },
    mounted(){

        var self = this

        self.defaultApi();



    },

}
</script>
