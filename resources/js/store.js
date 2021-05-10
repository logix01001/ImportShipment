import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from "vuex-persistedstate";
import storeNavigation from './store/navigation'
import storeHomeIndex from './store/HomeIndex'
import storeCurrentRoute from './store/CurrentRoute'
//import storeCsrf from './store/Csrf';
import storeModal from './store/Modal';
import storeDateSelected from './store/DateSelected'
Vue.use(Vuex)


const store = new Vuex.Store({
    modules:{
        storeNavigation:{
            namespaced: true,
            ...storeNavigation
        },
        storeHomeIndex:{
            namespaced: true,
            ...storeHomeIndex
        },
        storeCurrentRoute:{
            namespaced: true,
            ...storeCurrentRoute
        },
        // storeCsrf:{
        //     namespaced: true,
        //     ...storeCsrf
        // },.
        storeModal:{
            namespaced: true,
            ...storeModal
        },
        storeDateSelected: {
            namespaced: true,
            ...storeDateSelected
        },

    },
    plugins:[
        createPersistedState({
            paths:  [
                        'storeNavigation',
                        'storeCurrentRoute',
                        'storeDateSelected',
                    ],
        }),
    ]
})



export default store;
