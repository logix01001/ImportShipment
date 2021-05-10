import Docs from './Docs';
export default class BOCDocs extends Docs
{

    public constructor()
    {
        super();
        this.docType = 'BOC'
        this.columns = [
            {
                title:"BL NO",
                width: 200,
                dataIndex: 'bl_number',
                key: 'bl_number',
                fixed: 'left',
                className: 'bl_number',
                align:'center',
                    scopedSlots: {
                        filterDropdown: 'filterDropdown',
                        filterIcon: 'filterIcon',
                        customRender: 'customRender',
                        },
                        onFilter: (value, record) =>
                        record.bl_number
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
            },
            {
                title:"TURN-OVER OF DOCS DATE",
                width: 200,
                dataIndex: 'turnover_process_date',
                key: 'turnover_process_date',
                className: 'turnover_process_date',
                align:'center',
                typevalue: 'turnover_process_date',
                typecolumn: 'datepicker',
            },
            {
                title:"TSAD NUMBER",
                width: 200,
                dataIndex: 'tsad_number',
                key: 'tsad_number',
                className: 'tsad_number',
                align:'center',
                scopedSlots: {
                    filterDropdown: 'filterDropdown',
                    filterIcon: 'filterIcon',
                    customRender: 'customRender',
                    },
                    onFilter: (value, record) =>
                    record.tsad_number
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
            },
            {
                title:"OP NUMBER",
                width: 200,
                className: 'op_number',
                align:'center',
                scopedSlots: {
                    filterDropdown: 'filterDropdown',
                    filterIcon: 'filterIcon',
                    customRender: 'opNumber',
                    },
                    onFilter: (value, record) =>
                    record.op_number
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
            },

            {
                title:"CONSIGNEE",
                width: 200,
                dataIndex: 'factory_abbr',
                key: 'factory_abbr',
                className: 'factory_code',
                align:'center',
                scopedSlots: {
                    filterDropdown: 'filterDropdown',
                    filterIcon: 'filterIcon',
                    customRender: 'customRender',
                    },
                    onFilter: (value, record) =>
                    record.factory_abbr
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
            },
            {
                title:"PORT OF DISCHARGE",
                width: 200,
                dataIndex: 'pod',
                key: 'pod',
                className: 'pod',
                align:'center',
                scopedSlots: {
                    filterDropdown: 'filterDropdown',
                    filterIcon: 'filterIcon',
                    customRender: 'customRender',
                    },
                    onFilter: (value, record) =>
                    record.pod
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
            },
            {
                title:"NO. OF CONTAINERS",
                width: 200,
                children: [
                        {
                            title:"VOLUME",
                            width: 100,
                            className: 'volume',
                            align:'center',
                            scopedSlots: {
                                customRender : 'volume'
                            }

                        },
                        {
                            title:"SIZE",
                            width: 100,
                            className: 'size',
                            align:'center',
                            scopedSlots: {
                                customRender : 'size'
                            }
                        },
                ],
            },
            {
                title:"CEZ NO.",
                width: 200,
                dataIndex: 'ip_number',
                key: 'ip_number',
                className: 'ip_number',
                align:'center',
            },
            {
                title:"AMOUNT",
                width: 100,
                className: 'amount',
                align:'center',
                dataIndex: 'amount',
                key: 'amount',
            },
            {
                title:"Send to PEZA",
                fixed: 'right',
                width: 150,
                className: 'is_pezasent',
                align:'center',
                scopedSlots: {
                    customRender : 'email_sending'
                }
            }
        ]
    }
}

