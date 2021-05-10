import _ from 'lodash'

const singleFind = (key,id,lists)=>{
    return _.find(lists,{[key]:id})
}

export {singleFind}
