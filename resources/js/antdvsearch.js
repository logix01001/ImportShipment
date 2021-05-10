
const antdvsearch =  (field) => {
    return {
        scopedSlots: {
            filterDropdown: 'filterDropdown',
            filterIcon: 'filterIcon',
            customRender: 'customRender',
        },
        onFilter: (value, record) =>
            record[field]
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
}

export {antdvsearch}
