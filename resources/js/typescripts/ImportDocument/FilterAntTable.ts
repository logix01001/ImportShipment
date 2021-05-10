const FilterTable = {

        scopedSlots: {
            filterDropdown: 'filterDropdown',
            filterIcon: 'filterIcon',
            customRender: 'customRender',
        },
        onFilter: (value, record,key = null) =>
        record.processing_date
            .toString()
            .toLowerCase()
            .includes(value.toLowerCase()),
        onFilterDropdownVisibleChange: visible => {
        if (visible) {
            setTimeout(() => {
            this.searchInput.focus();
            }, 0);
        }
    },
}


const setKey = (key)=>{
    let setkey = key

    return FilterTable
}
