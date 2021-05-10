<template >
    <div>
        <!-- NAVIGATION COMPONENTS -->
        <Navi :auth="auth" :permissions="permissions">
            <template #content>

                <v-form ref="newuserform">
                    <v-row>
                        <v-col><h2>New User</h2></v-col>
                    </v-row>
                <v-row>
                <v-col>
                    <v-text-field require outlined placeholder="Fullname" v-model="newuser.name" dense :rules="rules.required"></v-text-field>
                </v-col>
                <v-col>
                    <v-text-field require outlined dense placeholder="Employee Code" v-model="newuser.username" :rules="rules.required"></v-text-field>
                </v-col>
                <v-col>
                    <v-text-field type="password" require outlined dense placeholder="Password" v-model="newuser.password" :rules="rules.required"></v-text-field>
                </v-col>
                <v-col>
                    <a-select  style="width: 100%"  v-model="newuser.role_name">
                        <a-select-option v-for="role in roles" :key="role.id" :value="role.id">
                            {{ role.name }}
                        </a-select-option>
                    </a-select>
                </v-col>
                <v-col>
                    <v-btn small color="primary" @click="saveuser"> Save </v-btn>
                </v-col>

                </v-row>
                 </v-form>
                <v-divider></v-divider>

                <a-table :data-source="users"
                :columns="columns"
                :pagination="pagination"
                rowKey="username"
                :scroll="{y: 600 | true }"
                :scrollToFirstRowOnChange="true"
                :rowClassName="(row,index)=> {
                    return row.id;
                }">

                    <span slot="roleslot"  slot-scope="row">
                        <div>
                            <div v-if="row.edit == true">
                                <v-row>
                                    <v-select
                                    :items="roles"
                                    label="select roles"
                                    item-text="name"
                                    item-value="name"
                                    v-model="row.name"
                                    dense
                                    hide-details=""
                                    outlined>
                                    </v-select>
                                </v-row>
                                <v-divider></v-divider>
                                <v-row>
                                    <!-- LIST OF PERMISSION CHECKBOX -->
                                    <v-checkbox
                                    v-for="pl in permissions_lists"
                                    :key="pl.id"
                                    v-model="row.permissions_update"
                                    :label="pl.name"
                                    :value="pl.name"
                                    dense
                                    ></v-checkbox>

                                </v-row>
                            </div>
                            <div v-else>
                                {{ row.name }}
                            </div>
                        </div>
                    </span>
                    <span slot="actionslot"  slot-scope="row">
                        <div>
                            <v-icon v-if="row.edit == false" @click="edituser(row)" >mdi-pencil-outline</v-icon>
                            <v-icon v-if="row.edit == true" @click="saveEdit(row)">mdi-check-bold</v-icon>
                            <v-icon v-if="row.edit == true" @click="cancelEdit(row)">mdi-cancel</v-icon>
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
import incharge from '../../typescripts/settings/incharge';
import _ from 'lodash';
import { mapActions } from 'vuex';
import Vue from 'vue';
import AxiosCon from '../../AxiosCon';
import rules from '@/js/rules'
export default {
    props:{
        auth: Object,
        permissions: Array,
        permissions_lists: Array,
        users: Array,
        roles: Array,
    },
    components: {
        Navi
    },
    data(){
        return {
            rules,
            searchText: '',
            messageObj: null,
            lodash: new lodash,
            usersIncharge: undefined,
            L_: require('lodash'),
            newuser: {
                name: '',
                username: '',
                password: '',
                role_name: '',
            },
            pagination: {
                total: 0,
                pageSize: 0,
                hideOnSinglePage: true
            },
            columns: [
                    {
                    title: 'Name',
                    width: '25%',
                    dataIndex: 'fullname',
                    align: 'center',
                    key: 'fullname',
                        scopedSlots: {
                            filterDropdown: 'filterDropdown',
                            filterIcon: 'filterIcon',
                            customRender: 'customRender',
                        },
                        onFilter: (value, record) =>
                            record.fullname
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
                    title: 'Employee Code',
                    width: '20%',
                    dataIndex: 'username',
                    align: 'center',
                    key: 'username',
                        scopedSlots: {
                            filterDropdown: 'filterDropdown',
                            filterIcon: 'filterIcon',
                            customRender: 'customRender',
                        },
                        onFilter: (value, record) =>
                            record.username
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
                        scopedSlots: {
                            customRender: 'roleslot'
                        }

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
        edituser(row)
        {
            let index = this.getIndex(row)
            Vue.set(this.users[index],'permissions_update',this.L_.map(this.users[index].permissions,'name'));
            this.users[index].edit = true

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
        saveEdit(user)
        {
            let index = this.getIndex(user)

            if(index > -1){
                AxiosCon.post('/settings/assignRole',{
                    user_id : user.id,
                    role_name : user.name,
                    permissions : user.permissions_update,
                })
                .then((res)=>{
                    iziToast.success({
                        title: 'Successfully saved.',
                        message: ''
                    });
                    this.users[index].edit = false
                    this.users[index].permissions = res.data
                })
            }
        },
        saveuser()
        {
            var self = this
            if(this.$refs.newuserform.validate()){



                iziToast.show({
                    theme: 'dark',
                    timeout: 0,
                    title: 'Update data',
                    message: 'Are you sure you want to continue?',
                    zindex: 2,
                    position: 'center', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
                    buttons: [
                        ['<button>Update</button>', function (instance, toast) {
                            AxiosCon.post(self.route('incharge.newuser'),{
                                ...self.newuser
                            })
                            .then((res)=>{

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
            }
        },
        cancelEdit(user)
        {

            let index = this.getIndex(user)

            if(index > -1){
                this.users[index].edit = false
                this.users[index].role_id = null
            }
        },
        getIndex(user)
        {
            let index = _.findIndex(this.users,{id: user.id})
            return index
        }

    },
    beforeMount(){

        var self = this

        self.changeRoute(window.location.pathname.split('/'))
        this.pagination.total = this.users.length
        this.pagination.pageSize = this.users.length

        _.forEach(this.users,(o) => {
            Vue.set(o,'edit',false)
        });
    },
    mounted(){


    }
}
</script>
