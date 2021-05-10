<template>
  <v-app id="inspire">
        <v-navigation-drawer
            :value="drawer"
            app
            clipped
            >
        <!-- SIDEBAR -->
        <v-container>

            <SBindex v-if="currentRoute[2] == 'index'"></SBindex>
        </v-container>
        <!-- END SIDEBAR -->
        </v-navigation-drawer>

        <v-app-bar
            app
            color="white"
            dense
            clipped-left
        >
                <v-container class="py-0 fill-height">
                        <!-- <v-avatar
                        class="mr-10"
                        color="grey darken-1"
                        size="32"
                        ></v-avatar> -->



                        <v-app-bar-nav-icon @click="drawerAction"></v-app-bar-nav-icon>
                        IMPORT SHIPPING DOCUMENT
                        <v-spacer></v-spacer>
                        <Links :permissions="permissions" :auth="auth"></Links>
                </v-container>
        </v-app-bar>

        <!-- SECTION -->
        <v-layout fill-height fill-width>
            <v-main style="background-color:#f5f5f5">
                <v-container id="scroll">
                    <slot name='content'></slot>
                </v-container>
            </v-main>
        </v-layout>

    </v-app>
</template>

<script>
import { mapActions, mapState } from 'vuex';
import SBindex from './SBIndex'
import Links from './Links'

export default {
    props:{
        auth: Object,
        permissions: Array
    },
    components:{
        Links,
        SBindex
    },
    data: () => ({

        links: [
            'Dashboard',
            'Messages',
            'Profile',
            'Updates',
        ],

    }),
    watch:{

    },
    methods:{
        ...mapActions('storeNavigation',['drawerAction']),
        ...mapActions('storeHomeIndex',['selectColumn','updateValue']),
    },
    computed:{

        ...mapState('storeNavigation',['drawer']),
        ...mapState('storeCurrentRoute',['currentRoute']),
        ...mapState('storeHomeIndex',['selectedColumn','selectedRows']),
    },
    mounted(){

    }
}
</script>

<style scoped>
#scroll {
    margin: 10px;
    max-width: 100%;
    width: 99%;
    max-height: 93vh;
    height: 93vh;
    overflow: auto;
    padding: 20px;
    background-color: white;
}
</style>
