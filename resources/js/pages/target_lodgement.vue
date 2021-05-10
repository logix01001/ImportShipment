<template >
    <div>
        <!-- NAVIGATION COMPONENTS -->
        <Navi :auth="auth" :permissions="permissions">
             <!-- SECTION SHOW -->
            <template #content>
                <v-row>
                    <v-col cols="2" offset-md="8">
                        <v-btn color="success" small @click="generate">Generate CSV</v-btn>
                    </v-col>
                    <v-col cols="2">
                        Total Record : <span class="headerfont">{{ data.length }}</span>
                    </v-col>
                </v-row>
                <a-table :data-source="sortUrgent"
                :columns="columns"
                :pagination="pagination"
                rowKey="document_code"
                :scroll="{  x: 1000 | true, y: 600 | true }"
                :scrollToFirstRowOnChange="true"
                :rowClassName="(row,index)=> {
                    return row.rowselected + (row.shipment_priority == 1 ? ' urgentrow' : '');
                }">
                    <div
                    slot="filterDropdown"
                    slot-scope="{ setSelectedKeys, selectedKeys, confirm, clearFilters, column }"
                    style="padding: 8px"
                    >
                    <a-input
                        v-ant-ref="c => (searchInput = c)"
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
            </template>
        </Navi>
    </div>
</template>
<script>

// COMPONENTS
import Navi from '@/js/components/Navigation.vue'

import _ from 'lodash'
import { mapActions } from 'vuex'
import {antdvsearch} from '@/js/antdvsearch';
import AxiosCon from '../AxiosCon';
import BasePath from '@/js/basepath'

export default {
    props:{
        auth: Object,
        dateNow: String,
        permissions: Array,
        data: Array
    },
    components:{
        Navi
    },

    data(){
        return {
            pagination: {
                total: 0,
                pageSize: 0,
                hideOnSinglePage: true
            },
            searchText: '',
            columns: [

                    {
                    title: 'BL Number',
                    fixed: 'left',
                    width: 200,
                    dataIndex: 'bl_number',
                    align: 'center',
                    key: 'bl_number',
                        scopedSlots: {
                            filterDropdown: 'filterDropdown',
                            filterIcon: 'filterIcon',
                            customRender: 'customRender',
                        },
                        onFilter: (value, record) =>
                            record.bl_number
                            .toString()
                            .toLowerCase()
                            .includes(value.toLowerCase()),
                        onFilterDropdownVisibleChange: visible => {
                            if (visible) {
                            setTimeout(() => {
                                this.searchInput.focus();
                            }, 0);
                            }
                        },
                    },
                    {
                        title: 'Document Received MC',
                        dataIndex: 'document_received_date',
                        align: 'center',
                        key: 'document_received_date',
                            scopedSlots: {
                                filterDropdown: 'filterDropdown',
                                filterIcon: 'filterIcon',
                                customRender: 'customRender',
                            },
                            onFilter: (value, record) =>
                                record.document_received_date
                                .toString()
                                .toLowerCase()
                                .includes(value.toLowerCase()),
                            onFilterDropdownVisibleChange: visible => {
                                if (visible) {
                                setTimeout(() => {
                                    this.searchInput.focus();
                                }, 0);
                                }
                            },
                    },
                    {
                        title: 'Consignee',
                        dataIndex: 'factory_abbr',
                        align: 'center',
                        key: 'factory_abbr',
                        scopedSlots: {
                            filterDropdown: 'filterDropdown',
                            filterIcon: 'filterIcon',
                            customRender: 'customRender',
                        },
                        onFilter: (value, record) =>
                            record.factory_abbr
                            .toString()
                            .toLowerCase()
                            .includes(value.toLowerCase()),
                        onFilterDropdownVisibleChange: visible => {
                            if (visible) {
                            setTimeout(() => {
                                this.searchInput.focus();
                            }, 0);
                            }
                        },
                    },
                    {
                    title: 'Latest',
                    dataIndex: 'latest_estimated_time_arrival',
                    align: 'center',
                    key: 'latest_estimated_time_arrival',
                        scopedSlots: {
                            filterDropdown: 'filterDropdown',
                            filterIcon: 'filterIcon',
                            customRender: 'customRender',
                        },
                        onFilter: (value, record) =>
                            record.latest_estimated_time_arrival
                            .toString()
                            .toLowerCase()
                            .includes(value.toLowerCase()),
                        onFilterDropdownVisibleChange: visible => {
                            if (visible) {
                            setTimeout(() => {
                                this.searchInput.focus();
                            }, 0);
                            }
                        },
                    },
                    {
                        title: 'Turnover Date',
                        dataIndex: 'turnover_process_date',
                        align: 'center',
                        key: 'turnover_process_date',
                        scopedSlots: {
                            filterDropdown: 'filterDropdown',
                            filterIcon: 'filterIcon',
                            customRender: 'customRender',
                        },
                        onFilter: (value, record) =>
                            record.turnover_process_date
                            .toString()
                            .toLowerCase()
                            .includes(value.toLowerCase()),
                        onFilterDropdownVisibleChange: visible => {
                            if (visible) {
                            setTimeout(() => {
                                this.searchInput.focus();
                            }, 0);
                            }
                        },
                    },
                    {
                        title: 'IP Date',
                        dataIndex: 'ip_date',
                        align: 'center',
                        key: 'ip_date',
                        scopedSlots: {
                            filterDropdown: 'filterDropdown',
                            filterIcon: 'filterIcon',
                            customRender: 'customRender',
                        },
                        onFilter: (value, record) =>
                            record.ip_date
                            .toString()
                            .toLowerCase()
                            .includes(value.toLowerCase()),
                        onFilterDropdownVisibleChange: visible => {
                            if (visible) {
                            setTimeout(() => {
                                this.searchInput.focus();
                            }, 0);
                            }
                        },
                    },


                ],
        }
    },
    watch:{

    },

    computed:{
        sortUrgent(){
            return _.orderBy(this.data, ['shipment_priority'],['desc']);
        }


    },
    methods:{
        ...mapActions('storeCurrentRoute',['changeRoute']),
        handleSearch(selectedKeys, confirm, dataIndex) {
            confirm();
            this.searchText = selectedKeys[0];
            this.searchedColumn = dataIndex;
        },
        handleReset(clearFilters) {
            clearFilters();
            this.searchText = '';
        },
        generate()
        {
            var tr = document.getElementsByClassName('ant-table-row')
            var docsgenerated = []

            Array.from(tr).forEach(t => {
                if(docsgenerated.indexOf(t.getAttribute('data-row-key')) < 0)
                    docsgenerated.push(t.getAttribute('data-row-key'))
            })

            location.replace(`${BasePath}downloadexcelTargetLodgementExtraction?` + 'docsids[]='+docsgenerated.join('&docsids[]='));

        }


    },
    beforeMount(){
        var self = this

        self.changeRoute(window.location.pathname.split('/'))
        this.pagination.total = this.data.length
        this.pagination.pageSize = this.data.length


    },
    mounted(){
        var self = this


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
    .headerfont{
        font-size: 18pt;
    }
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
