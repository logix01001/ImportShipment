export default {
    state:{
        newrecordModal : false,
        bocextract : false,
    },
    getters:{

        newrecordModal: (state) => {
            return state.newrecordModal;
        }
    },
    actions: {
        open({commit},typemodal = 'newrecord')
        {
            commit('setModal',{action: true, typemodal: typemodal})
        },
        close({commit},typemodal = 'newrecord')
        {
            commit('setModal',{action: false, typemodal: typemodal})
        },
    },
    mutations:
    {
        setModal(state,data)
        {

            console.log(data)
            switch(data.typemodal){
                case 'newrecord':
                    state.newrecordModal = data.action
                    break;
                case 'bocextract':
                    state.bocextract = data.action
                    break;
            }

        }
    }
}
