import Docs from './Docs';
export default class LodgementDocs extends Docs
{

    public constructor()
    {
        super();
        this.docType = 'LODGEMENT'
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
                             //this.searchInput.focus();
                            }, 0);
                        }
                },
            },
            {
                title:"Priority",
                width: 100,
                className: 'shipment_priority',
                align:'center',
                dataIndex: 'shipment_priority',
                key: 'shipment_priority',
                scopedSlots: {
                    customRender: 'shipment_priority'
                }
            },
            {
                title:"DOCUMENTS RECEIVED FROM MC",
                width: 400,
                children: [
                        {
                            title:"Date",
                            width: 200,
                            dataIndex: 'document_received_date',
                            key: 'document_received_date',
                            className: 'document_received_date',
                            align:'center',
                        },
                        {
                            title:"Time",
                            width: 200,
                            dataIndex: 'document_received_time',
                            key: 'document_received_time',
                            className: 'document_received_time',
                            align:'center',
                            scopedSlots: {
                                filterDropdown: 'filterDropdown',
                                filterIcon: 'filterIcon',
                                customRender: 'customRender',
                            },
                            onFilter: (value, record) =>
                                record.document_received_time
                                    .toString()
                                    .toLowerCase()
                                    .includes(value.toLowerCase()),
                                onFilterDropdownVisibleChange: visible => {
                                if (visible) {
                                    setTimeout(() => {
                                    //this.searchInput.focus();
                                    }, 0);
                                }
                            },
                        }
                ],
                typevalue: 'document_received_date',
                typecolumn: 'datepicker',
            },
            // {
            //     title:"DOCUMENTS RECEIVED FROM DOCS PROCESSING",
            //     width: 450,
            //     children: [
            //             {
            //                 title:"",
            //                 width: 50,
            //                 className: 'is_received',
            //                 align:'center',
            //                 //dataIndex: 'is_received',
            //                // key: 'is_received',
            //                 scopedSlots: {
            //                     customRender : 'is_received'
            //                 }

            //             },
            //             {
            //                 title:"DATE",
            //                 width: 200,
            //                 dataIndex: 'is_received_date',
            //                 key: 'is_received_date',
            //                 className: 'is_received',
            //                 align:'center',
            //             },
            //             {
            //                 title:"RECEIVED BY",
            //                 width: 200,
            //                 // dataIndex: 'is_received_by',
            //                 // key: 'is_received_by',
            //                 className: 'is_received',
            //                 align:'center',
            //                 scopedSlots: {
            //                     customRender : 'is_received_by'
            //                 }

            //             }
            //     ],
            //     typevalue: 'document_received_processing_date',
            //     typecolumn: 'datepicker',
            // },
            {
                title:"CONSIGNEE",
                width: 200,
                dataIndex: 'factory_abbr',
                key: 'factory_abbr',
                className: 'factory_abbr',
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
                        //this.searchInput.focus();
                        }, 0);
                    }
                },
            },
            {
                title:"FORWARDER",
                width: 200,
                dataIndex: 'forwarder',
                key: 'forwarder',
                className: 'forwarder',
                align:'center',
                scopedSlots: {
                    filterDropdown: 'filterDropdown',
                    filterIcon: 'filterIcon',
                    customRender: 'customRender',
                    },
                    onFilter: (value, record) =>
                    record.forwarder
                        .toString()
                        .toLowerCase()
                        .includes(value.toLowerCase()),
                    onFilterDropdownVisibleChange: visible => {
                    if (visible) {
                        setTimeout(() => {
                        //this.searchInput.focus();
                        }, 0);
                    }
                },
            },
            {
                title:"SHIPPING LINE",
                width: 200,
                dataIndex: 'shipping_company_name',
                key: 'shipping_company_name',
                className: 'shipping_company_code_fk',
                align:'center',
                scopedSlots: {
                    filterDropdown: 'filterDropdown',
                    filterIcon: 'filterIcon',
                    customRender: 'customRender',
                    },
                    onFilter: (value, record) =>
                    record.shipping_company_name
                        .toString()
                        .toLowerCase()
                        .includes(value.toLowerCase()),
                    onFilterDropdownVisibleChange: visible => {
                    if (visible) {
                        setTimeout(() => {
                        //this.searchInput.focus();
                        }, 0);
                    }
                },
            },
            {
                title:"ETA",
                width: 200,
                dataIndex: 'estimated_time_arrival',
                key: 'estimated_time_arrival',
                className: 'estimated_time_arrival',
                align:'center',
                typevalue: 'estimated_time_arrival',
                typecolumn: 'datepicker',
            },
            {
                title:"ATA",
                width: 200,
                dataIndex: 'actual_time_arrival',
                key: 'actual_time_arrival',
                className: 'actual_time_arrival',
                align:'center',
                typevalue: 'actual_time_arrival',
                typecolumn: 'datepicker',
            },
            {
                title:"LATEST ETA",
                width: 200,
                dataIndex: 'latest_estimated_time_arrival',
                key: 'latest_estimated_time_arrival',
                className: 'latest_estimated_time_arrival',
                align:'center',
                typevalue: 'latest_estimated_time_arrival',
                typecolumn: 'datepicker'
            },
            {
                title:"TARGET LODGEMENT",
                width: 200,
                dataIndex: 'target_lodgement_date',
                key: 'target_lodgement_date',
                className: 'target_lodgement_date',
                align:'center',
                typevalue: 'target_lodgement_date',
                typecolumn: 'datepicker',
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
                        //this.searchInput.focus();
                        }, 0);
                    }
                },

            },
            {
                title:"REGISTRY NO.",
                width: 200,
                dataIndex: 'registry_no',
                key: 'registry_no',
                className: 'registry_no',
                align:'center',
                scopedSlots: {
                    filterDropdown: 'filterDropdown',
                    filterIcon: 'filterIcon',
                    customRender: 'customRender',
                    },
                    onFilter: (value, record) =>
                    record.registry_no
                        .toString()
                        .toLowerCase()
                        .includes(value.toLowerCase()),
                    onFilterDropdownVisibleChange: visible => {
                    if (visible) {
                        setTimeout(() => {
                        //this.searchInput.focus();
                        }, 0);
                    }
                },
            },
            {
                title:"CONNECTING VESSEL",
                width: 200,
                dataIndex: 'connecting_vessel',
                key: 'connecting_vessel',
                className: 'connecting_vessel',
                align:'center',
                scopedSlots: {
                    filterDropdown: 'filterDropdown',
                    filterIcon: 'filterIcon',
                    customRender: 'customRender',
                    },
                    onFilter: (value, record) =>
                    record.connecting_vessel
                        .toString()
                        .toLowerCase()
                        .includes(value.toLowerCase()),
                    onFilterDropdownVisibleChange: visible => {
                    if (visible) {
                        setTimeout(() => {
                        //this.searchInput.focus();
                        }, 0);
                    }
                },
            },
            {
                title:"SOURCE DETAILS",
                width: 200,
                dataIndex: 'source_details',
                key: 'source_details',
                className: 'source_details',
                align:'center',
            },
            {
                title:"TRANSHIPMENT PORT",
                width: 200,
                dataIndex: 'transhipment_port',
                key: 'transhipment_port',
                className: 'transhipment_port',
                align:'center',
            },
            {
                title:"STATUS",
                width: 200,
                dataIndex: 'document_status',
                key: 'document_status',
                className: 'document_status',
                align:'center',
                scopedSlots: {
                    filterDropdown: 'filterDropdown',
                    filterIcon: 'filterIcon',
                    customRender: 'customRender',
                    },
                    onFilter: (value, record) =>
                    record.document_status
                        .toString()
                        .toLowerCase()
                        .includes(value.toLowerCase()),
                    onFilterDropdownVisibleChange: visible => {
                    if (visible) {
                        setTimeout(() => {
                        //this.searchInput.focus();
                        }, 0);
                    }
                },
            },
            {
                title:"IP CREATED",
                width: 200,
                dataIndex: 'ip_date',
                key: 'ip_date',
                className: 'ip_date',
                align:'center',
                typevalue: 'ip_date',
                typecolumn: 'datepicker',
                scopedSlots: {
                    filterDropdown: 'filterDropdown',
                    filterIcon: 'filterIcon',
                    customRender: 'customRender',
                    },
                    onFilter: (value, record) =>
                        value == '-' ? record.ip_date.toString() === '' : record.ip_date
                            .toString()
                            .toLowerCase()
                            .includes(value.toLowerCase())

                    ,
                    onFilterDropdownVisibleChange: visible => {
                    if (visible) {
                        setTimeout(() => {
                        //this.searchInput.focus();
                        }, 0);
                    }
                },
            },
            {
                title:"E2M CREATED",
                width: 200,
                dataIndex: 'e2m_date',
                key: 'e2m_date',
                className: 'e2m_date',
                align:'center',
                typevalue: 'e2m_date',
                typecolumn: 'datepicker',
            },
            {
                title:"IP CHECKED DATE",
                width: 200,
                dataIndex: 'ip_checked_date',
                key: 'ip_checked_date',
                className: 'ip_checked_date',
                align:'center',
                typevalue: 'ip_checked_date',
                typecolumn: 'datepicker',
            },
            {
                title:"E2M CHECKED DATE",
                width: 200,
                dataIndex: 'e2m_checked_date',
                key: 'e2m_checked_date',
                className: 'e2m_checked_date',
                align:'center',
                typevalue: 'e2m_checked_date',
                typecolumn: 'datepicker',
            },
            {
                title:"IP APPROVAL DATE",
                width: 200,
                dataIndex: 'ip_approval_date',
                key: 'ip_approval_date',
                className: 'ip_approval_date',
                align:'center',
                typevalue: 'ip_approval_date',
                typecolumn: 'datepicker',
            },
            {
                title:"IP NUMBER",
                width: 200,
                dataIndex: 'ip_number',
                key: 'ip_number',
                className: 'ip_number',
                align:'center',
            },
            {
                title:"E2M APPROVAL DATE",
                width: 200,
                dataIndex: 'e2m_approval_date',
                key: 'e2m_approval_date',
                className: 'e2m_approval_date',
                align:'center',
                typevalue: 'e2m_approval_date',
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
                        //this.searchInput.focus();
                        }, 0);
                    }
                },
            },
            {
                title:"DUTIABLE",
                width: 200,
                dataIndex: 'dutiable',
                key: 'dutiable',
                className: 'dutiable',
                align:'center',

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
                scopedSlots: {
                    filterDropdown: 'filterDropdown',
                    filterIcon: 'filterIcon',
                    customRender: 'customRender',
                    },
                    onFilter: (value, record) =>
                     value == '-' ? record.turnover_process_date.toString() === '' : record.turnover_process_date
                            .toString()
                            .toLowerCase()
                            .includes(value.toLowerCase())

                    ,
                    onFilterDropdownVisibleChange: visible => {
                    if (visible) {
                        setTimeout(() => {
                        //this.searchInput.focus();
                        }, 0);
                    }
                },
            },
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
            {
                title:"REMARKS",
                width: 200,
                dataIndex: 'remarks_tag',
                key: 'remarks_tag',
                className: 'remarks_tag',
                align:'center',
            },
            {
                title:"TAG",
                width: 200,
                dataIndex: 'assessment_tag',
                key: 'assessment_tag',
                className: 'assessment_tag',
                align:'center',
            },
            {
                title:"IP LODGEMENT- IN CHARGE",
                width: 200,
                // dataIndex: 'ip_lodgement_incharge',
                // key: 'ip_lodgement_incharge',
                className: 'ip_lodgement_incharge',
                align:'center',
                scopedSlots: {
                    customRender : 'ip_lodgement_incharge'
                }
            },
            {
                title:"E2M LODGEMENT-IN CHARGE",
                width: 200,
                // dataIndex: 'e2m_lodgement_incharge',
                // key: 'e2m_lodgement_incharge',
                className: 'e2m_lodgement_incharge',
                align:'center',
                scopedSlots: {
                    customRender : 'e2m_lodgement_incharge'
                }
            },
            // {
            //     title:"NO. OF ITEMS IN INVOICE",
            //     width: 200,
            //     dataIndex: 'invoice_item_number',
            //     key: 'invoice_item_number',
            //     className: 'invoice_item_number',
            //     align:'center',
            // },
        ]
    }
}

