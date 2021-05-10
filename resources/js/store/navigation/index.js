export default {
    state:{
        drawer : false,
    },
    getters:{
        getDrawer(){
            return state.drawer
        }
    },
    actions: {
        drawerAction({commit})
        {
            commit('setDrawer')
        }
    },
    mutations:
    {
        setDrawer(state)
        {
            state.drawer = !state.drawer
        }
    }
}
