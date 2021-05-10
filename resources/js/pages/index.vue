<template >
    <div>
        <!-- NAVIGATION COMPONENTS -->
        <Navi :auth="auth" :permissions="permissions">
             <!-- SECTION SHOW -->


            <template #content>
                <!-- DIALOG NEW RECORD -->
                <v-dialog
                        v-model="newrecordModal"
                        persistent
                        max-width="600px">
                <v-card>
                    <v-card-title>
                        <span class="headline">New Record</span>
                    </v-card-title>
                    <v-card-text>
                    <v-container>
                        <v-form ref="newrecordForm">
                            <v-row>
                                <v-col>
                                    <v-text-field
                                        v-model="newRecordObj.formObj.bl_number"
                                        label="Bl Number"
                                        required
                                        dense
                                        :rules="rules.required"

                                        outlined>
                                    </v-text-field>
                                </v-col>
                            </v-row>
                            <v-row>
                                <v-col>
                                    <v-select
                                        :items="shipping_lines_list"
                                        v-model="newRecordObj.formObj.shipping_line_code"
                                        label="Shipping Lines"
                                        item-text="shipping_company_name"
                                        item-value="shipping_company_code"
                                        dense
                                        :rules="rules.required"
                                        outlined>
                                    </v-select>
                                </v-col>
                            </v-row>
                            <v-row>
                                <v-col>
                                    <v-select
                                        :items="factories_list"
                                        label="Consignee"
                                        v-model="newRecordObj.formObj.consignee"
                                        item-text="factory_abbr"
                                        item-value="factory_code"
                                        dense
                                        :rules="rules.required"
                                        outlined>
                                    </v-select>
                                </v-col>
                            </v-row>
                            <v-row>
                                <v-col>
                                    <v-menu
                                        v-model="dateM"
                                        :close-on-content-click="false"
                                        :nudge-right="40"
                                        transition="scale-transition"
                                        offset-y
                                        min-width="auto"
                                    >
                                        <template v-slot:activator="{ on, attrs }">
                                        <v-text-field
                                            v-model="newRecordObj.formObj.document_received_date"
                                            label="Received date from MC"
                                            readonly
                                            v-bind="attrs"
                                            v-on="on"
                                            dense
                                            outlined
                                        ></v-text-field>
                                        </template>
                                        <v-date-picker
                                        v-model="newRecordObj.formObj.document_received_date"
                                        @input="dateM = false"
                                        ></v-date-picker>
                                    </v-menu>
                                    <!-- <v-text-field
                                            v-model="newRecordObj.formObj.document_received_date"
                                            label="Received date from MC"
                                            required
                                            dense
                                            :rules="rules.required"
                                            outlined>
                                    </v-text-field> -->
                                </v-col>
                                <v-col>
                                    <v-text-field
                                            v-model="newRecordObj.formObj.document_received_time"
                                            label="Received time from MC"
                                            required
                                            dense
                                            :rules="rules.required"
                                            outlined>
                                    </v-text-field>
                                </v-col>
                                <v-col>
                                    <v-text-field
                                            v-model="newRecordObj.formObj.sps_ic_number"
                                            label="SPS No."
                                            required
                                            dense
                                            outlined>
                                    </v-text-field>
                                </v-col>
                            </v-row>
                        </v-form>
                    </v-container>
                    </v-card-text>
                    <v-card-actions>
                        <v-spacer></v-spacer>
                            <v-btn
                                color="blue darken-1"
                                text
                                @click="close('newrecord')"
                            >
                                Close
                            </v-btn>
                            <v-btn
                                color="primary"
                                :disabled="saveProcess"
                                @click="submitNewRecord"
                            >
                            Save
                        </v-btn>
                    </v-card-actions>
                </v-card>
                </v-dialog>
                <!-- END DIALOG NEW RECORD -->

                <!-- DIALOG BOC EXTRACT-->
                <v-dialog
                        v-model="bocextract"
                        persistent
                        max-width="600px">
                <v-card>
                    <v-card-title>
                        <span class="headline">EXTRACTION</span>
                    </v-card-title>
                    <v-card-text>
                    <v-container>
                        <v-form ref="formbocextract">
                            <v-row>
                                <v-col cols="12" >
                                    Type:
                                    <a-radio-group v-model="selectedExtract" button-style="solid">
                                        <a-radio-button value="boc" v-if="myRole == 'MASTER'">
                                        BOC
                                        </a-radio-button>
                                        <a-radio-button value="endorsement">
                                        Endorsement
                                        </a-radio-button>
                                        <a-radio-button value="summary">
                                        Summary
                                        </a-radio-button>
                                        <a-radio-button value="receiving_copy">
                                        Receiving copy
                                        </a-radio-button>
                                    </a-radio-group>

                                </v-col>
                            </v-row>
                            <v-divider></v-divider>
                            <v-row>
                                <v-col cols="8" offset-md="2">
                                    <a-range-picker valueFormat="YYYY-MM-DD" format="YYYY-MM-DD" v-model="bocdaterange">
                                        <template slot="dateRender"  slot-scope="current">
                                            <div class="ant-calendar-date" :style="getCurrentStyle(current)">
                                            {{ current.date() }}
                                            </div>
                                        </template>
                                    </a-range-picker>
                                </v-col>


                            </v-row>
                            <v-divider></v-divider>
                        </v-form>
                    </v-container>
                    </v-card-text>
                    <v-card-actions>
                        <v-spacer></v-spacer>
                            <v-btn
                                color="blue darken-1"
                                text
                                @click="close('bocextract')"
                            >
                                Close
                            </v-btn>
                            <v-btn
                                color="primary"
                                :disabled="selectedExtract == '' || bocdaterange.length == 0"
                                @click="DownloadExtract"
                            >
                            Generate
                        </v-btn>
                    </v-card-actions>
                </v-card>
                </v-dialog>
                <!-- END DIALOG BOC EXTRACT -->

                <!-- <a-modal v-model="newrecordModal" title="Basic Modal" okText="Save Record" > -->
                    <!-- <a-form-item
                        :label-col="formItemLayout.labelCol"
                        :wrapper-col="formItemLayout.wrapperCol"
                        label="BL Number">
                    <a-input placeholder="input placeholder" v-model="newRecordObj.formObj.bl_number" />
                    </a-form-item>
                    <a-form-item
                        :label-col="formItemLayout.labelCol"
                        :wrapper-col="formItemLayout.wrapperCol"
                        label="Shipping Lines">
                        <a-select style="width: 100%"  v-model="newRecordObj.formObj.shipping_line_code"  placeholder="Shipping Line">
                            <a-select-option v-for="sl in shipping_lines_list" :key="sl.shipping_company_code" :value="sl.shipping_company_code">
                                {{ sl.shipping_company_name }}
                            </a-select-option>
                        </a-select>
                    </a-form-item>
                    <a-form-item
                        :label-col="formItemLayout.labelCol"
                        :wrapper-col="formItemLayout.wrapperCol"
                        label="Shipping Lines">
                        <a-select style="width: 100%"  v-model="newRecordObj.formObj.factory"  placeholder="Shipping Line">
                            <a-select-option v-for="fact in factories_list" :key="fact.factory_code" :value="fact.factory_code">
                                {{ fact.factory_abbr }}
                            </a-select-option>
                        </a-select>
                    </a-form-item> -->

                <!-- </a-modal> -->

                <div v-if="myRole == ''">
                     <v-container>
                        <v-alert
                        dense
                        outlined
                        type="error"
                        >
                        No assign role yet. Please coordinate to your leader.
                        </v-alert>
                     </v-container>
                </div>
                <div v-else>
                     <div v-if="!isFiltered">
                        <v-container>

                            <v-row>
                                <v-col
                                    md="10"
                                    offset-md="1">
                                    <v-card
                                        class="pa-8"
                                        outlined
                                        tile
                                    >
                                    <center>

                                        <h2 align="center">DOCUMENT SUBMITTED BY FACTORY / HRD MC</h2>
                                        <v-divider></v-divider>
                                        <small>YYYY-MM-DD (start) ~ YYYY-MM-DD (END)</small>
                                        <a-range-picker valueFormat="YYYY-MM-DD" format="YYYY-MM-DD" v-model="daterange">
                                            <template slot="dateRender"  slot-scope="current">
                                                <div class="ant-calendar-date" :style="getCurrentStyle(current)">
                                                {{ current.date() }}
                                                </div>
                                            </template>
                                        </a-range-picker>
                                        <v-btn color="success" @click="generate"> Generate </v-btn>
                                    </center>
                                </v-card>
                                </v-col>
                            </v-row>

                        </v-container>

                    </div>
                    <div v-else>
                        <div style="float:right">Total records : <span style="color:red"> {{dataFilter.length}} </span> <span v-if="showContainers"> Total Volumes : <span style="color:red">{{ sizeContainer[0] + sizeContainer[1] }}</span></span></div>

                        <a-table  align="center" :columns="MyDocumentObj.MyAccess.document.columns"
                            class="tableant"
                            :pagination="pagination"
                            rowKey="document_code"
                            :data-source="dataFilter"
                            :scroll="{ x: 1500 | true , y: 700 | true }"
                            :scrollToFirstRowOnChange="true"
                            :row-selection="rowSelection"

                            :rowClassName="(row,index)=> {
                                return row.rowselected + (row.shipment_priority == 1 ? ' urgentrow' : '');
                            }">

                            <span slot="shipment_priority"  slot-scope="row">
                                <div>
                                    <span class="urgenttext"> {{ row == 1 ? ' URGENT ' : '' }}</span>
                                </div>
                            </span>

                            <span slot="ip_lodgement_incharge"  slot-scope="row">
                                <div v-show="row.ip_lodgement_incharge != ''">
                                    {{ users_name(row.ip_lodgement_incharge) }}
                                </div>
                            </span>

                            <span slot="e2m_lodgement_incharge"  slot-scope="row">
                                <div v-show="row.e2m_lodgement_incharge != ''">
                                    {{ users_name(row.e2m_lodgement_incharge) }}
                                </div>
                            </span>

                            <span slot="cro_web_date"   slot-scope="row">
                                <div :class="More1DayObj.checkDate(row.actual_discharge) && row.cro_web_date === '' ? 'crowebdelay' : ''" >
                                    {{ row.cro_web_date }} &nbsp;
                                </div>
                            </span>

                            <span slot="volume"  slot-scope="row">
                                <div class="volumesTD" :data-size20="row.size_20" :data-size40="row.size_40">
                                    <VolumeView :size_20="row.size_20" :size_40="row.size_40"></VolumeView>
                                </div>
                            </span>

                            <span slot="size"  slot-scope="row">
                                <div>
                                    <VolumeView :size_20="row.size_20" :size_40="row.size_40" :size="true"></VolumeView>
                                </div>
                            </span>
                            <div
                                slot="filterDropdown"
                                slot-scope="{ setSelectedKeys, selectedKeys, confirm, clearFilters, column }"
                                style="padding: 8px"
                                >
                                <a-input
                                    v-ant-ref="c => (MyDocumentObj.MyAccess.document.searchInput = c)"
                                    :placeholder="`Search ${column.dataIndex}`"
                                    :value="selectedKeys[0]"
                                    style="width: 188px; margin-bottom: 8px; display: block;"
                                    @change="e => setSelectedKeys(e.target.value ? [e.target.value] : [])"
                                    @pressEnter="() => handleSearch(selectedKeys, confirm, column.dataIndex)"
                                />
                                <a-button
                                    type="primary"
                                    icon="search"
                                    size="small"
                                    style="width: 90px; margin-right: 8px"
                                    @click="() => handleSearch(selectedKeys, confirm, column.dataIndex)"
                                >
                                    Search
                                </a-button>
                                <a-button size="small" style="width: 90px" @click="() => handleReset(clearFilters)">
                                    Reset
                                </a-button>
                                </div>
                                <a-icon
                                slot="filterIcon"
                                slot-scope="filtered"
                                type="search"
                                :style="{ color: filtered ? '#108ee9' : undefined }"
                                />
                                <template slot="customRender" slot-scope="text, record, index, column">
                                <span v-if="searchText && searchedColumn === column.dataIndex">
                                    <template
                                    v-for="(fragment, i) in text
                                        .toString()
                                        .split(new RegExp(`(?<=${searchText})|(?=${searchText})`, 'i'))"
                                    >
                                    <mark
                                        v-if="fragment.toLowerCase() === searchText.toLowerCase()"
                                        :key="i"
                                        class="highlight"
                                        >{{ fragment }}</mark
                                    >
                                    <template v-else>{{ fragment }}</template>
                                    </template>
                                </span>
                                <template v-else>
                                    {{ text }}
                                </template>
                                </template>
                        </a-table>

                    </div>
                </div>


                <Overlay :overlay="overlay"></Overlay>

            </template>
        </Navi>
    </div>
</template>
<script>

// COMPONENTS
import Navi from '@/js/components/Navigation.vue'
import Overlay from '@/js/components/Overlay.vue'
import VolumeView from '@/js/components/VolumeView.vue'

import _ from 'lodash'
import { mapActions, mapState } from 'vuex'
import Vue from 'vue'
import newRecord from '../typescripts/ImportDocument/newRecord';
import ShippingLines from '../typescripts/Api/ShippingLines';
import Factories from '../typescripts/Api/Factories';
import rules from '@/js/rules'
import { getCurrentStyle } from '@/js/const/daterange'
import MyDocument from '../typescripts/MyDocument';
import AxiosCon from '../AxiosCon'
import {singleFind} from '@/js/FindLists'
import BasePath from '@/js/basepath'
import More1Day from '../typescripts/CheckDate/More1Day';
import MasterArrivalDocs from '../typescripts/ImportDocument/MasterArrivalDocs'
import LodgementDocs from '../typescripts/ImportDocument/LodgementDocs'
import MasterLodgeDocs from '../typescripts/ImportDocument/MasterLodgeDocs';



//-------------------------
const formItemLayout = {
  labelCol: { span: 5 },
  wrapperCol: { span: 12, offset:2 },
};
const formTailLayout = {
  labelCol: { span: 5 },
  wrapperCol: { span: 8, offset: 4 },
};
//-------------------------
export default {
    props:{
        myRole:String,
        auth: Object,
        dateNow: String,
        user_lists: Array,
        permissions: Array,
        shippinglines: Array,
        factories: Array,
    },
    components: {
        Navi,
        Overlay,
        VolumeView,


    },
    data(){
        return {
            selectedExtract: '',
            searchInput: '',
            sizeContainer: [0,0],
            overlay : false,
            dateM: false,
            showContainers: false,
            daterange: [],
            bocdaterange: [],
            newRecordObj: new newRecord,
            ApiShippingLines: new ShippingLines,
            ApiFactories: new Factories,
            More1DayObj: new More1Day,
            MyDocumentObj : null,
            shipping_lines_list: [],
            factories_list: [],
            rules,
            formItemLayout,
            formTailLayout,
            selectAll: false,
            saveProcess: false,
            pagination: {
                total: 0,
                pageSize: 0,
                hideOnSinglePage: true
            },
            messageObj: null,
            data: [],
            selectedColumnOld: '',
            searchText: '',
            searchedColumn: '',
        }
    },
    watch:{
        selectedColumn(val){

            if(val != '' && val != null){
                this.selectedColumnOld = val
            }
            if(val == ''){
                 this.selectedColumnOld = ''
            }

           this.colorSelected(this.selectedColumnOld)

        },
        updatableclick(val){
            var self = this


            iziToast.show({
                theme: 'dark',
                timeout: 0,
                title: 'Update data',
                message: 'Are you sure you want to continue?',
                zindex: 2,
                position: 'center', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
                buttons: [
                    ['<button>Update</button>', function (instance, toast) {
                        self.overlay = true
                        self.MyDocumentObj.updateData(self.selectedID,self.selectedColumn,self.value)
                        .then((res)=>{
                            //SERVER SIDE
                            //self.generateData()

                            var updatedvalue = self.value
                            var scope_selectedColumn = self.selectedColumn
                            switch(self.selectedColumn)
                            {
                                case 'factory_code':
                                    updatedvalue = singleFind('factory_code',self.value,self.factories_list).factory_abbr
                                    scope_selectedColumn = 'factory_abbr'
                                    break
                                case 'shipping_company_code_fk':
                                    updatedvalue = singleFind('shipping_company_code',self.value,self.shipping_lines_list).shipping_company_name
                                    scope_selectedColumn = 'shipping_company_name'
                                    break
                            }



                            //CLIENT ONLY
                            let obj = _.filter(self.data,{selected:true})

                            _.forEach(obj, (row,i)=>{
                                if(scope_selectedColumn == 'is_received' && updatedvalue == false){
                                    Vue.set(row,'is_received_date',"")
                                    Vue.set(row,'is_received_by',"")
                                }
                                if(scope_selectedColumn == 'is_received' && updatedvalue == true){
                                    Vue.set(row,'is_received_date',self.dateNow)
                                    Vue.set(row,'is_received_by',self.auth.username)
                                }

                                //FORWARDER
                                if(scope_selectedColumn == 'forwarder'){
                                    let value = '';

                                    if(updatedvalue != ''){
                                        value = updatedvalue == 'NO FORWARDER' ? 'WITH CREDIT LINE' : 'NO CREDIT LINE';
                                    }

                                    Vue.set(row,'credit_line',value)
                                }


                                if((scope_selectedColumn == 'ip_date' || scope_selectedColumn == 'e2m_date')){
                                    let type = scope_selectedColumn.split('_')[0]
                                    Vue.set(row,`${type}_lodgement_incharge`,(updatedvalue != '') ? self.auth.username : '');
                                }


                                Vue.set(row,scope_selectedColumn,(scope_selectedColumn == 'ip_lodgement_incharge' || scope_selectedColumn == 'e2m_lodgement_incharge') ? self.auth.username : updatedvalue )

                                // if((scope_selectedColumn == 'ip_lodgement_incharge' || scope_selectedColumn == 'e2m_lodgement_incharge') && updatedvalue == false){
                                //     Vue.set(row,scope_selectedColumn,"")
                                // }

                            })

                            iziToast.success({
                                title: 'Successfully saved.',
                                message: '',
                            });
                        })
                        .catch(err=>{

                            iziToast.error({
                                title: 'Error',
                                message: 'Error in updating data.',
                            });
                        })
                        .finally(()=>{
                            self.overlay = false
                            instance.hide({
                                transitionOut: 'fadeOutUp',
                            }, toast, 'buttonName');
                        })

                    }], // true to focus
                    ['<button>Cancel</button>', function (instance, toast) {
                        instance.hide({
                            transitionOut: 'fadeOutUp',
                        }, toast, 'buttonName');
                    }, true]
                ]
            });
            //let obj = _.filter(this.data,{selected:true})
            // _.forEach(obj, (row,i)=>{
            //     Vue.set(row,self.selectedColumn,self.value)

            // })
        },
        updatableVolumeclick(val)
        {
            var self = this

            /*

            */

            iziToast.show({
                theme: 'dark',
                timeout: 0,
                title: 'Update data',
                message: 'Are you sure you want to continue?',
                zindex: 2,
                position: 'center', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
                buttons: [
                    ['<button>Update</button>', function (instance, toast) {
                        self.overlay = true
                        self.MyDocumentObj.updateVolumeData(self.selectedID,self.valueVolume)
                        .then((res)=>{
                            //SERVER SIDE
                            //self.generateData()

                            //CLIENT ONLY
                            let obj = _.filter(self.data,{selected:true})

                            _.forEach(obj, (row,i)=>{
                                Vue.set(row,"size_20",self.valueVolume.size_20)
                                Vue.set(row,"size_40",self.valueVolume.size_40)
                            })

                            iziToast.success({
                                title: 'Successfully saved.',
                                message: '',
                            });
                        })
                        .catch(err=>{

                            iziToast.error({
                                title: 'Error',
                                message: 'Error in updating data.',
                            });
                        })
                        .finally(()=>{
                            self.overlay = false
                            instance.hide({
                                transitionOut: 'fadeOutUp',
                            }, toast, 'buttonName');
                        })

                    }], // true to focus
                    ['<button>Cancel</button>', function (instance, toast) {
                        instance.hide({
                            transitionOut: 'fadeOutUp',
                        }, toast, 'buttonName');
                    }, true]
                ]
            });


        },
        filterableclick(val)
        {
            this.SelectCheckBoxReset()

        },
        async documentType(val){
            this.overlay = true
            await this.MyDocumentObj.setDocTypeMaster(val);
            await this.updateColumnAccessLists(this.MyDocumentObj.MyAccess.accessLists)
            await this.updateColumnShownLists(this.MyDocumentObj.MyAccess.document.columns)
            await this.generate();
            await this.checkShowContainer()
            this.getTotalContainers();
            this.SelectCheckBoxReset()
        }
    },
    computed:{

        ...mapState('storeHomeIndex',['selectedColumn','value','updatableclick','documentType','updatableVolumeclick','valueVolume','filterableclick','selectedColumnFilter','daterangeFilter']),
        ...mapState('storeDateSelected',['dateFrom','dateTo','isFiltered','dataGenerated']),
       // ...mapState('storeHomeIndex',['columnAccessLists']),
        // ...mapState('storeModal',['newrecordModal']),
        newrecordModal: {
            get () { return this.$store.state.storeModal.newrecordModal},
            set (value) { this.close('newrecord') }
        },
        bocextract: {
            get () { return this.$store.state.storeModal.bocextract},
            set (value) { this.close('bocextract') }
        },


        dataFilter()
        {
            var self = this

            if(this.daterangeFilter.length > 0){
                var startDate = new Date(self.daterangeFilter[0]);
                var endDate = new Date(self.daterangeFilter[1]);

                //if(chkbox.parentNode.classList.contains('ant-checkbox-checked')){

                //}
                return _.filter( this.data, function(item) {
                    var date = new Date(item[self.selectedColumnFilter])

                    return date >= startDate &&  date <= endDate
                })


                console.log(resultProductData)
                return resultProductData;
            }

            return self.data
        },
        selectedID()
        {

            return _.map(_.filter(this.data,{'selected':true}),(o)=>{
                return o.document_code
            })

        },
        rowSelection() {
            var self = this
            return {
                fixed: true,
                onSelect: (record, selected, selectedRows) => {
                    Vue.set(record,'selected',selected)
                    //record.selected = selected
                    // let obj = _.find(self.data,{'id':parseInt(selectedRowKeys)})
                    // console.log(obj,selectedRowKeys)
                    // obj.selected = !obj.selected
                    record.rowselected =  record.selected ? "rowselected" : ""

                    let data = _.filter(self.data,{'selected':true})

                    self.countRows(data.length)
                    setTimeout(() => {
                        self.colorSelected(self.selectedColumnOld)
                    }, 100);

                },
                onSelectAll: (selected, selectedRows, changeRows) => {

                    var self = this
                    changeRows.forEach(function(e){
                         Vue.set(e,'selected',selected)
                        e.rowselected =  e.selected ? "rowselected" : ""

                        let data = _.filter(self.data,{'selected':true})

                        self.countRows(data.length)
                        setTimeout(() => {
                            self.colorSelected(self.selectedColumnOld)
                        }, 100);
                    })
                    // console.log(`selectedRowKeys: ${selectedRowKeys}`, 'selectedRows: ', selectedRows);
                },
                getCheckboxProps: record => ({
                    props: {
                        disabled: record.name === 'Disabled User', // Column configuration not to be checked
                        name: record.name,
                    },

                }),

            }
        }
    },
    methods:{
        ...mapActions('storeCurrentRoute',['changeRoute']),
        ...mapActions('storeModal',['close']),
        ...mapActions('storeDateSelected',['dateSelected','changeIsFiltered','resetDateSelected','updateData']),
        ...mapActions('storeHomeIndex',['updateColumnAccessLists','updateColumnShownLists','updateRole','resetFilter']),

        getCurrentStyle,
        async checkShowContainer()
        {
            //ONLY FOR LODGEMENT DOCUMENT
            if(this.MyDocumentObj.MyAccess.document instanceof MasterLodgeDocs ||  this.MyDocumentObj.MyAccess.document instanceof LodgementDocs ){
                this.showContainers = true
            }
            else{
                this.showContainers = false
            }

        },
        DownloadBOCExtract(){
            location.replace(`${BasePath}downloadexcelBOCExtraction/${this.bocdaterange[0]}/${this.bocdaterange[1]}`);
        },
        DownloadExtract(){
            switch(this.selectedExtract)
            {
                case 'boc' :
                    location.replace(`${BasePath}downloadexcelBOCExtraction/${this.bocdaterange[0]}/${this.bocdaterange[1]}`);
                    break;
                case 'endorsement':
                    location.replace(`${BasePath}downloadexcelEndorsementExtraction/${this.bocdaterange[0]}/${this.bocdaterange[1]}`);
                    break;
                case 'summary':
                    location.replace(`${BasePath}downloadexcelBOC/${this.bocdaterange[0]}/${this.bocdaterange[1]}`);
                    break;
                case 'receiving_copy':
                    location.replace(`${BasePath}downloadexcelBOCCopy/${this.bocdaterange[0]}/${this.bocdaterange[1]}`);
                    break;
            }

        },
        SelectCheckBoxReset()
        {
            var chkbox =  document.getElementsByClassName('ant-checkbox-input')[0]
            if(chkbox){
                if(chkbox.parentNode.classList.contains('ant-checkbox-checked')){
                    chkbox.click()
                }else{
                    chkbox.click()
                    chkbox.click()
                }
            }
        },
        users_name(username)
        {

            if(username == "" || username == null){
                return "";
            }
            let obj = _.find(this.user_lists,{username : username})

            return `${obj.name}`
        },
        saveReceived()
        {

        },
        generate()
        {
            this.overlay = true

            this.dateSelected({to:this.daterange[0],from: this.daterange[1]})

            this.generateData()
        },
        generateData()
        {
            this.MyDocumentObj.generateData([this.dateFrom, this.dateTo])
            .then(res=>{

                this.data = res.data
                this.pagination.total = this.data.length
                this.pagination.pageSize = this.data.length
                this.overlay = false
                _.forEach(this.data, o => {
                    o.is_received  = (o.is_received == 0 ? false : true)

                })
                this.updateData(this.data)
                if(res.data.length > 0){
                     this.changeIsFiltered()
                }else{
                    iziToast.info({
                        title: 'No record found',
                        message: ''
                    });
                }


            })
        },
        colorSelected(val){

            let obj = document.getElementsByClassName('ant-table-row-selected ')

            if(val != ''){
                let columns = document.getElementsByClassName('selectedColumn')
                _.forEach(columns, function(dobj) {
                    columns[0].classList.remove("selectedColumn");
                });

                if(this.selectedColumn != null){
                    _.forEach(obj, function(dobj) {
                        if(!dobj.hasAttribute('style')){
                            let column = dobj.getElementsByClassName(val)[0]
                            column.classList.add("selectedColumn");
                        }
                    });
                }
            }

        },
        selected(id){
            let obj = _.find(this.data,{'id':id})
            obj.selected = !obj.selected
            obj.rowselected =  obj.selected ? "rowselected" : ""

            let data = _.filter(this.data,{'selected':true})

            this.countRows(data.length)
            setTimeout(() => {
                this.colorSelected(this.selectedColumn)
            }, 100);


        },
        ...mapActions('storeHomeIndex',['countRows']),
        submitNewRecord(){
            if(this.$refs.newrecordForm.validate()){
                this.saveProcess = true
                this.newRecordObj.submit()
                .then(()=>{
                    //this.generateData()
                    iziToast.success({
                        title: 'Successfully Saved.',
                        message: ''
                    });
                    this.newRecordObj.resetForm();
                    this.$refs.newrecordForm.reset();
                })
                .catch(err=>{
                    iziToast.error({
                        title: 'Encountered Error while saving. please contact system incharge',
                        message: ''
                    });
                })
                .finally(()=>{
                      this.saveProcess = false
                })
            }
            //
        },

        getTotalContainers()
        {
            this.sizeContainer = [0,0];
            var dataset = [];
            setTimeout(() => {
                Array.from(document.getElementsByClassName('volumesTD')).forEach(
                    td=>{

                    let objdataset = Object.assign({}, td.dataset)
                    objdataset.size20 = parseInt(objdataset.size20)
                    objdataset.size40 = parseInt(objdataset.size40)
                    dataset.push(objdataset)

                }
            )
            this.sizeContainer = [ _.sumBy(dataset, 'size20'), _.sumBy(dataset, 'size40')]

            }, 200);

        },
        handleSearch(selectedKeys, confirm, dataIndex) {
                this.SelectCheckBoxReset()


                setTimeout(() => {
                    this.getTotalContainers()
                    confirm();
                    this.searchText = selectedKeys[0];
                    this.searchedColumn = dataIndex;
                }, 100);
        },

        handleReset(clearFilters) {
            clearFilters();
                this.getTotalContainers()
                this.searchText = '';
            },
        },
    beforeMount(){
        var self = this
        this.resetDateSelected()
        self.changeRoute(window.location.pathname.split('/'))
        self.resetFilter()
        self.shipping_lines_list = self.shippinglines
        self.factories_list = self.factories



        if(this.myRole != ''){
             this.MyDocumentObj = new MyDocument(this.myRole)
        }


        if(this.isFiltered){

            this.overlay = true
            this.generateData()
        }


        this.updateRole(this.myRole)

    },
    beforeDestroy()
    {
        this.resetDateSelected()

    },
    async mounted(){
        var self = this


        if(this.myRole != ''){
            this.updateColumnAccessLists(this.MyDocumentObj.MyAccess.accessLists)
            this.updateColumnShownLists(this.MyDocumentObj.MyAccess.document.columns)
            await this.checkShowContainer()
        }




        // if(this.isFiltered){
        //     if(this.dataGenerated.length == 0){
        //         this.resetDateSelected()
        //     }else{

        //         // this.data = this.dataGenerated
        //         // this.pagination.total = self.data.length
        //         // this.pagination.pageSize = self.data.length
        //         // _.forEach(_.filter(this.data,{'selected':true}),(o)=>{

        //         //     Vue.set(o,'selected',false)
        //         // })

        //         // this.countRows(0)
        //     }

        // }


    },
    // beforeDestroy() {

    //     if(this.isFiltered){

    //         _.forEach(_.filter(this.data,{'selected':true}),(o)=>{
    //             o.selected = false
    //         })
    //         this.updateData(this.data)

    //     }
    // },
}
</script>


<style scope>

    /* .urgenttext {
        animation: blinker 1s linear infinite;
    } */
    /* @keyframes blinker {
        50% {
            opacity: 0;
        }
    } */
    .crowebdelay {
        background: red;
        border: 1px solid red;
    }
    .urgentrow > td {
         /* background-color: #fc3e21 !important; */
         color: #fc3e21;
    }

    .urgentrow .ant-table-row-selected {
        /* background-color: #fc3e21 !important; */
        color: #fc3e21;

    }
    /* .ant-table-row-selected {
        background-color: #6bcef2;
    } */
    .ant-table-row-selected > .selectedColumn
    {
        background-color: #f2f533 !important;
        color: black;

    }
    .tableant {
        height: 88vh;
    }
    .ant-table-thead > tr > th {
        border: 1px solid #757575
    }
    .ant-table-tbody > tr > td {
        border: 1px solid #eeeeee
    }
    .w-100{
        width: 100px !important;
    }
    .w-150{
        width: 150px !important;
    }
    .w-200{
        width: 200px;
    }
    .w-250{
        width: 250px;
    }
    .w-300{
        width: 300px;
    }
    .theme--light.v-data-table > .v-data-table__wrapper > table > thead > tr > th
    {
        border: 1px solid #e0e0e0;
    }

    .ant-table td { white-space: nowrap; }
</style>
