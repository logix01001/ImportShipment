export default {
    state:{
        search : '',
    },
    getters:{

        csrf: (state) => {
            return state.csrf;
        }
    },
    actions: {
        changeCsrf({commit},data)
        {
            commit('setCsrf',data)
        },
    },
    mutations:
    {
        setCsrf(state,data)
        {
            state.csrf = data
        }
    }
}
