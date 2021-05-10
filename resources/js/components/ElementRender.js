import Vue from "vue"
import Vuetify from "vuetify"

Vue.use(Vuetify)
Vue.component("RenderString", {
  props: {
    selectionLists:{
        type:Array
    },
    string: {
        type:String
    },
  },

  render(h) {
    var render = {

        template: '<div>' + this.string + '</div> ',
        methods: {

        },
        vuetify: new Vuetify(),
        data(){
            return {
                value: null,
                dateM: false,
                selectionLists: [],
            }
        },
        beforeMount() {
            this.value = null
            this.dateM = false

            this.selectionLists = this.$parent._props.selectionLists
            console.log(this.selectionLists)
            console.log('before mount')

        },
        destroyed() {

        },
    }
    return h(render)
  }
})
