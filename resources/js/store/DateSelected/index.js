export default {
    state:{
        dataGenerated: [],
        dateFrom : '',
        dateTo : '',
        isFiltered: false,
    },
    getters:{

        dateFrom: (state) => {
            return state.dateFrom;
        },
        dateTo: (state) => {
            return state.dateTo;
        }
    },
    actions: {
        dateSelected({commit},data)
        {
            commit('setDateSelected',data)
        },
        changeIsFiltered({commit})
        {
            commit('setIsFiltered')
        },
        resetDateSelected({commit})
        {
            commit('setReset')
        },
        updateData({commit},data)
        {
            commit('setDataGenerated',data)
        }
    },
    mutations:
    {
        setIsFiltered(state)
        {
            state.isFiltered = true
        },
        setDataGenerated(state,data)
        {
            state.dataGenerated = data
        },
        setDateSelected(state,data)
        {
            state.dateFrom = data.to
            state.dateTo = data.from
        },
        setReset(state){
            state.dateFrom = ''
            state.dateTo = ''
            state.isFiltered = false
            state.dataGenerated = []
        }

    }
}
