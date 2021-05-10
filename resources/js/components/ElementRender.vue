<template>
    <div>
        <div id="appRender"></div>

    </div>
</template>

<script>
import Vue from 'vue'
new Vue({
    el: '#appRender',
    vuetify: new Vuetify(),
    props:{
        selectionLists: {
            type: Array
        },
        string: {
            type:string
        }

    },
    data()
    {
        return {
            value: '',
            menu : false,
        }
    },
    mounted(){

    }
}).$mount(el)
</script>
