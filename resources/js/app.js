/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

import { App, plugin } from '@inertiajs/inertia-vue'
import { InertiaProgress } from '@inertiajs/progress'
import Vue from 'vue'
import Vuetify from 'vuetify'
import Antd from 'ant-design-vue';
import Vuex from 'vuex'

Vue.use(plugin)
Vue.use(Vuetify)
Vue.use(Vuex)
Vue.use(Antd);

import store from './store'

const el = document.getElementById('app')

import route from 'ziggy';
import { Ziggy } from './ziggy';




window.iziToast = require('izitoast');

Vue.prototype.$csrf = window.Laravel.csrfToken;

InertiaProgress.init()
Vue.mixin({
    methods: {
        route: (name, params, absolute, config = Ziggy) => route(name, params, absolute, config),
        test:()=>{

        }
    },
});
new Vue({
    store,
    vuetify: new Vuetify(),
    render: h => h(App, {
        props: {
        initialPage: JSON.parse(el.dataset.page),
        resolveComponent: name => require(`./Pages/${name}`).default,
        },

    }),
    mounted(){

    }
}).$mount(el)
