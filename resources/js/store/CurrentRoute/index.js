export default {
    state:{
        currentRoute : '',
    },
    getters:{

        currentRoute: (state) => {
            return state.currentRoute;
        }
    },
    actions: {
        changeRoute({commit},data)
        {
            commit('setCurrentRoute',data)
        },
    },
    mutations:
    {
        setCurrentRoute(state,data)
        {
            state.currentRoute = data
        }
    }
}
