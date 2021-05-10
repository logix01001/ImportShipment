<template>
    <div>

        <v-spacer></v-spacer>
        <!-- <inertia-link :href="route('home.index')"><v-btn text>Home</v-btn></inertia-link>
        <inertia-link :href="route('croweblists.index')"><v-btn text>CRO Monitoring</v-btn></inertia-link>
        <inertia-link :href="route('boc.index')"><v-btn text>BOC processing</v-btn></inertia-link> -->

        <v-menu
                open-on-hover
                bottom
                offset-y
                >
                <template v-slot:activator="{ on, attrs }">
                    <v-btn
                    v-bind="attrs"
                    v-on="on"
                    text
                    >
                    Pages
                    </v-btn>
                </template>

                <v-list>
                    <v-list-item>
                        <inertia-link :href="route('home.index')"><v-btn text>Home</v-btn></inertia-link>
                    </v-list-item>
                    <v-list-item>
                        <inertia-link :href="route('croweblists.index')"><v-btn text>CRO Monitoring</v-btn></inertia-link>
                    </v-list-item>
                    <v-list-item>
                        <inertia-link :href="route('boc.index')"><v-btn text>BOC processing</v-btn></inertia-link>
                    </v-list-item>
                     <v-list-item>
                        <inertia-link :href="route('pages.target_lodgement')"><v-btn text>Target Lodgement</v-btn></inertia-link>
                    </v-list-item>
                </v-list>
        </v-menu>
        <v-menu
                v-if="!hasPermission(permissions,'access-settings')"
                open-on-hover
                bottom
                offset-y
                >
                <template v-slot:activator="{ on, attrs }">
                    <v-btn
                    v-bind="attrs"
                    v-on="on"
                    text
                    >
                    Settings
                    </v-btn>
                </template>

                <v-list>
                    <v-list-item>
                        <inertia-link  :href="route('incharge.index')"><v-btn text>incharge</v-btn></inertia-link>
                    </v-list-item>
                    <v-list-item>
                        <inertia-link  :href="route('settings.shippingline.index')"><v-btn text>Shipping Lines</v-btn></inertia-link>
                    </v-list-item>
                </v-list>
        </v-menu>

        <v-btn text
            onclick="event.preventDefault();
            document.getElementById('logout-form').submit();"
            >Logout</v-btn>

        <v-spacer></v-spacer>

        <form id="logout-form" :action="route('logout')" method="POST" class="d-none">
            <!-- @csrf -->
              <input type="hidden" name="_token" :value="csrf">

        </form>

    </div>
</template>

<script>
import {hasPermission} from '@/js/const/hasPermission'
export default {
    props:{
        auth: Object,
        permissions: Array
    },
    data(){
        return {
            csrf : ''
        }
    },
    methods:{
       hasPermission,
    },
    mounted(){
         this.csrf = window.Laravel.csrfToken;
    }
}
</script>
