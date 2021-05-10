export default {
    state:{
        selectedColumn : '',
        selectedColumnFilter : '',
        selectedRows : 0,
        value: '',
        documentType: true,
        updatableclick: false,
        updatableVolumeclick: false,
        filterableclick: false,
        daterangeFilter: [],
        columnAccessLists: [],
        columnShownLists: [],
        myRole: '',
        valueVolume: {
            size_20: 0,
            size_40: 0
        }
    },
    getters:{

        selectedColumn: (state) => {
            return state.selectedColumn;
        },
        columnAccessLists: (state)=>{
            return state.columnAccessLists
        },
        columnShownLists:(state)=>{
            return state.columnShownLists
        },
        getSelectedRows(){
            return state.selectedRows
        }
    },
    actions: {
        countRows({commit},data)
        {
            commit('setCount',data)
        },
        selectColumn({commit},data)
        {
            commit('setColumn',data)
        },
        updateDocType({commit},data)
        {
            commit('setUpdateDocType')
        },
        updateValue({commit},data)
        {
            commit('setUpdate',data)
        },
        updateValueVolume({commit},data)
        {
            commit('setUpdateVolume',data)
        },
        updateFilter({commit},data)
        {
            commit('setFilter',data)
        },
        resetFilter({commit})
        {
            commit('setResetFilter')
        },
        updateRole({commit},data)
        {
            commit('setRole',data)
        },
        updateColumnAccessLists({commit},data)
        {
            commit('setAccessLists',data)
        },
        updateColumnShownLists({commit},data)
        {
            commit('setColumnShownLists',data)
        }
    },
    mutations:
    {
        setCount(state,data)
        {
            state.selectedRows = data
        },
        setAccessLists(state,data)
        {
            state.columnAccessLists = data
        },
        setColumn(state,data)
        {
            state.selectedColumn = data
        },
        setColumnShownLists(state,data)
        {
            state.columnShownLists = data
        },
        setUpdateDocType(state){
            state.documentType = !state.documentType
        },
        setUpdate(state,data){
            state.updatableclick = !state.updatableclick
            state.value = data
        },
        setUpdateVolume(state,data)
        {
            state.updatableVolumeclick = !state.updatableVolumeclick
            state.valueVolume = data
        },
        setFilter(state,data){

            state.filterableclick = !state.filterableclick
            state.daterangeFilter = data.daterange
            state.selectedColumnFilter = data.column
        },
        setResetFilter(state)
        {
            state.filterableclick = !state.filterableclick
            state.daterangeFilter = []
            state.selectedColumnFilter = ''
        },
        setRole(state,data)
        {
            state.myRole = data
        }
    }
}
