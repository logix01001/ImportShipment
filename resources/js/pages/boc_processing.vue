<template >
    <div>
        <!-- NAVIGATION COMPONENTS -->
        <Navi :auth="auth" :permissions="permissions">
             <!-- SECTION SHOW -->

            <template #content>

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
                     <div v-if="!bocFiltered">
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

                                        <h2 align="center">DATE TURN OVER OF DOCUMENTS</h2>
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
                        <div style="float:right">Total record : <span style="color:red"> {{dataFilter.length}} </span></div>
                                        <div align="left">
                                            <h2 align="center">DATE TURN OVER OF DOCUMENTS</h2>
                                                <v-divider></v-divider>
                                                <small>YYYY-MM-DD (start) ~ YYYY-MM-DD (END)</small>
                                                <a-range-picker valueFormat="YYYY-MM-DD" format="YYYY-MM-DD" v-model="daterange">
                                                    <template slot="dateRender"  slot-scope="current">
                                                        <div class="ant-calendar-date" :style="getCurrentStyle(current)">
                                                        {{ current.date() }}
                                                        </div>
                                                    </template>
                                                </a-range-picker>
                                            <v-btn color="success" small @click="generate"> Generate </v-btn>

                                            <!-- <v-btn color="warning" small @click="downloadExcel"> Summary </v-btn>
                                            <v-btn color="danger" small @click="downloadExcelRCopy"> Receiving Copy </v-btn> -->

                                        </div>
                                        <v-divider></v-divider>
                        <a-table  :columns="MyDocumentObj.MyAccess.document.columns"
                            class="tableant"
                            :pagination="pagination"
                            rowKey="document_code"
                            :data-source="dataFilter"
                            :scroll="{ x: 700 | true , y: 700 | true }"
                            :scrollToFirstRowOnChange="true"
                            :rowClassName="(row,index)=> {
                                return row.rowselected ;
                            }">

                            <!--   :row-selection="rowSelection" -->
                            <span slot="volume"  slot-scope="row">
                                <div>
                                    <VolumeView :size_20="row.size_20" :size_40="row.size_40"></VolumeView>
                                </div>
                            </span>

                            <span slot="size"  slot-scope="row">
                                <div>
                                    <VolumeView :size_20="row.size_20" :size_40="row.size_40" :size="true"></VolumeView>
                                </div>
                            </span>

                            <span slot="email_sending"   slot-scope="row">
                                <template >
                                    <div v-if="!hasPermission(permissions,'peza-email-sending')">
                                        <v-btn :disabled="row.is_pezasent == 1" @click="sending_email(row.lodged_id)">{{row.is_pezasent ? 'Sent' : 'Send Email'}}</v-btn>
                                    </div>
                                    <div v-else>
                                        <center>Not authorized</center>
                                    </div>
                                </template>

                            </span>

                            <span slot="opNumber"  slot-scope="row">
                                <div>

                                    <div v-if="myRole == 'MANILA PROCESSOR' || myRole == 'MASTER'">
                                        <v-text-field
                                            v-model="row.op_number"
                                            :outlined="row.pod == 'SOUTH'"
                                            hide-details=""
                                            dense
                                            :disabled="row.pod != 'SOUTH'"
                                            @blur="saveOpNumber(row)"
                                        ></v-text-field>

                                    </div>
                                    <div v-else>
                                        {{ row.op_number }}
                                    </div>
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
import { hasPermission } from '@/js/const/hasPermission'
import MyDocument from '../typescripts/MyDocument';
import AxiosCon from '../AxiosCon'
import {singleFind} from '@/js/FindLists'
import BOCDocs from '../typescripts/ImportDocument/BOCDocs'
import BasePath from '@/js/basepath'
import PEZABOC from '../typescripts/Email/PEZABOC';


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
            overlay : false,
            dateM: false,
            daterange: [],
            PEZABOCObj: new PEZABOC,
            newRecordObj: new newRecord,
            ApiShippingLines: new ShippingLines,
            ApiFactories: new Factories,
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
            bocFiltered: false,
        }
    },
    watch:{
        selectedColumn(val){
            console.log(val)
            if(val != '' && val != null){
                this.selectedColumnOld = val
            }
            if(val == ''){
                 this.selectedColumnOld = ''
            }

           this.colorSelected(this.selectedColumnOld)

        },
    },

    computed:{

        ...mapState('storeHomeIndex',['selectedColumn','value','selectedColumnFilter','daterangeFilter']),
        ...mapState('storeDateSelected',['dateFrom','dateTo','isFiltered','dataGenerated']),
       // ...mapState('storeHomeIndex',['columnAccessLists']),
        // ...mapState('storeModal',['newrecordModal']),
        newrecordModal: {
            get () { return this.$store.state.storeModal.newrecordModal},
            set (value) { this.close() }
        },
        dataFilter()
        {
            var self = this

            if(this.daterangeFilter.length > 0){
                 var startDate = new Date(self.daterangeFilter[0]);
                var endDate = new Date(self.daterangeFilter[1]);
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
    },
    methods:{
        ...mapActions('storeCurrentRoute',['changeRoute']),
        ...mapActions('storeModal',['close']),
        ...mapActions('storeDateSelected',['dateSelected','resetDateSelected']),
        ...mapActions('storeHomeIndex',['updateColumnAccessLists','updateColumnShownLists','updateRole','resetFilter']),

        getCurrentStyle,
        hasPermission,
        sending_email(id)
        {
            this.overlay = true;
            this.PEZABOCObj.setId(id).send()
            .then(res=>{

                iziToast.success({
                    title: 'Email sent!',
                    message: ''
                });
                //DISABLED BUTTON of sending email

                let index = _.findIndex(this.data,{lodged_id : id})
                Vue.set(this.data[index],'is_pezasent',1)
                this.overlay = false;

            })
            .catch(err=>{

                err.response.data.forEach(log=>{
                    iziToast.error({
                        title: 'Unable to send email.',
                        message: log,
                        timeout: 0
                    });
                })
                this.overlay = false;
            })

        },
        users_name(username)
        {
            if(username == ""){
                return "";
            }
            let obj = _.find(this.user_lists,{username : username})

            return `${obj.username} ${obj.name}`
        },
        generate()
        {
            this.overlay = true

            // this.dateSelected({to:this.daterange[0],from: this.daterange[1]})

            this.generateData()
        },
        generateData()
        {
            this.MyDocumentObj.generateDataBOC([this.daterange[0],this.daterange[1]])

            .then(res=>{

                this.data = res.data
                this.pagination.total = this.data.length
                this.pagination.pageSize = this.data.length
                this.overlay = false


                if(res.data.length > 0){
                    this.bocFiltered = true
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
        handleSearch(selectedKeys, confirm, dataIndex) {
                var chkbox =  document.getElementsByClassName('ant-checkbox-input')[0]
                if(chkbox.parentNode.classList.contains('ant-checkbox-checked')){
                    chkbox.click()
                }


                setTimeout(() => {
                    confirm();
                    this.searchText = selectedKeys[0];
                    this.searchedColumn = dataIndex;
                }, 100);



                //ant-checkbox-checked




        },

        handleReset(clearFilters) {
            clearFilters();
                this.searchText = '';
        },
        saveOpNumber(row){
           // AxiosCon.put(`${BasePath}opnumber`,
            AxiosCon.put(this.route('put.opnumber'),
            {
                docID: row.document_code,
                op_number: row.op_number
            }).then(res=>{

                if(res.status == 200)
                {
                    iziToast.success({
                        title: 'Successfully saved.',
                        message: `${row.bl_number} - ${row.op_number}`,
                    });
                }

            }).catch(err=>{
                iziToast.error({
                    title: 'Update Error',
                    message: `${err}`,
                });
            })
        },
        // downloadExcel()
        // {
        //     location.replace(`${BasePath}downloadexcelBOC/${this.daterange[0]}/${this.daterange[1]}`);
        // },
        // downloadExcelRCopy()
        // {
        //     location.replace(`${BasePath}downloadexcelBOCCopy/${this.daterange[0]}/${this.daterange[1]}`);
        // }
    },
    beforeMount(){
        var self = this

        self.changeRoute(window.location.pathname.split('/'))
        self.resetFilter()
        self.shipping_lines_list = self.shippinglines
        self.factories_list = self.factories

        // this.ApiShippingLines.getApi()
        // .then((res)=>{
        //     self.shipping_lines_list = res.data
        // })

        // this.ApiFactories.getApi()
        // .then((res)=>{
        //     self.factories_list = res.data

        // })


        if(this.myRole != ''){
            this.MyDocumentObj = new MyDocument(this.myRole)
             //OVERIDING BOCDocs
            this.MyDocumentObj.setDocType(new BOCDocs)
        }


        if(this.isFiltered){


            //this.overlay = true

            //this.generateData()

        }


        this.updateRole(this.myRole)

    },
    mounted(){
        var self = this

        if(this.myRole != ''){
            this.updateColumnAccessLists(this.MyDocumentObj.MyAccess.accessLists)

            this.updateColumnShownLists(this.MyDocumentObj.MyAccess.document.columns)
        }


        if(this.isFiltered){
            if(this.dataGenerated.length == 0){
                this.resetDateSelected()
            }else{

                this.data = this.dataGenerated
                this.pagination.total = self.data.length
                this.pagination.pageSize = self.data.length
                _.forEach(_.filter(this.data,{'selected':true}),(o)=>{

                    Vue.set(o,'selected',false)
                })

                this.countRows(0)
            }

        }


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
    /* .ant-table-row-selected {
        background-color: #6bcef2;
    } */
    .ant-table-row-selected > .selectedColumn
    {
        background-color: #f2f533 !important;

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
