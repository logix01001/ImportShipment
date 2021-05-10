<template >
    <div>
        <!-- NAVIGATION COMPONENTS -->
        <Navi :auth="auth" :permissions="permissions">
            <template #content>
                <!-- {{ permissions_lists }} -->
                <v-divider></v-divider>
                <a-table :data-source="shipping_lines"
                :columns="columns"
                :pagination="pagination"
                rowKey="id"
                :scroll="{y: 600 | true }"
                :scrollToFirstRowOnChange="true"
                :rowClassName="(row,index)=> {
                    return row.id;
                }">

                    <span slot="actionslot"  slot-scope="row">
                        <div>
                            <a-radio-group @change="handleSave(row.id,row.is_showed)" v-model="row.is_showed" button-style="solid">
                                <a-radio-button :value="0">
                                Hide
                                </a-radio-button>
                                <a-radio-button :value="1">
                                Show
                                </a-radio-button>
                            </a-radio-group>
                        </div>
                    </span>
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
                <v-divider></v-divider>
            </template>

        </Navi>

    </div>
</template>

<script>
import Navi from '@/js/components/Navigation.vue'
import lodash from '../../typescripts/lodash';
import _ from 'lodash';
import { mapActions } from 'vuex';
import Vue from 'vue';
import AxiosCon from '../../AxiosCon';
export default {
    props:{
        auth: Object,
        permissions: Array,
        shipping_lines: Array

    },
    components: {
        Navi
    },
    data(){
        return {
            lodash: new lodash,
            searchText: '',
            pagination: {
                total: 0,
                pageSize: 0,
                hideOnSinglePage: true
            },
            columns: [
                    {
                    title: 'Shipping Line Name',
                    width: '30%',
                    dataIndex: 'shipping_company_name',
                    align: 'center',
                    key: 'shipping_company_name',
                        scopedSlots: {
                            filterDropdown: 'filterDropdown',
                            filterIcon: 'filterIcon',
                            customRender: 'customRender',
                        },
                        onFilter: (value, record) =>
                            record.shipping_company_name
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
                        title : '',
                        align: "center",
                        width: '10%',
                        scopedSlots: {
                            customRender: 'actionslot'
                        }
                    }
             ]
        }
    },
    computed:{
        PermissionList(){

        },

    },
    methods: {

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
        saveEdit(user)
        {

        },
        cancelEdit(user)
        {

        },
        getIndex(user)
        {

        },
        handleSearch(selectedKeys, confirm, dataIndex) {
            confirm();
            this.searchText = selectedKeys[0];
            this.searchedColumn = dataIndex;
        },
        handleReset(clearFilters) {
            clearFilters();
            this.searchText = '';
        },
        handleSave(id,value)
        {
            AxiosCon.put(this.route('settings.shippingline.put'),{
                sl_id : id,
                is_showed : value,
            })
            .then(()=>{
                iziToast.success({
                    title: 'Successfully saved.',
                    message: ''
                });
            })
        }

    },
    beforeMount(){
        var self = this
        self.changeRoute(window.location.pathname.split('/'))
        this.pagination.total = this.shipping_lines.length
        this.pagination.pageSize = this.shipping_lines.length

    },
    mounted(){


    }
}
</script>
