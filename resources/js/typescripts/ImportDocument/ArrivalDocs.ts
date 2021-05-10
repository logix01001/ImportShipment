import Docs from './Docs';
export default class ArrivalDocs extends Docs
{


    public constructor()
    {
        super();
        this.docType = 'ARRIVAL'
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
                title:"MASTER BL",
                width: 150,
                className: 'master_bl_number',
                align:'center',
                dataIndex: 'master_bl_number',
                key: 'master_bl_number',
            },
            {
                title:"Priority",
                width: 200,
                className: 'shipment_priority',
                align:'center',
                dataIndex: 'shipment_priority',
                key: 'shipment_priority',
                scopedSlots: {
                    customRender: 'shipment_priority'
                }
            },
            {
                title:"OBL",
                width: 100,
                className: 'obl',
                align:'center',
                dataIndex: 'obl',
                key: 'obl',
            },
            {
                title:"OBL RECVD. DATE",
                width: 200,
                className: 'obl_received_date',
                align:'center',
                dataIndex: 'obl_received_date',
                key: 'obl_received_date',
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
            {
                title:"PROCESSING",
                width: 400,
                children: [
                        {
                            title:"Date",
                            width: 200,
                            dataIndex: 'processing_date',
                            key: 'processing_date',
                            className: 'processing_date',
                            align:'center',
                        },
                        {
                            title:"Time",
                            width: 200,
                            dataIndex: 'processing_time',
                            key: 'processing_time',
                            className: 'processing_time',
                            align:'center',
                        }
                ],
                typevalue: 'document_received_processing_date',
                typecolumn: 'datepicker',
            },
            {
                title:"SPS IC NO",
                width: 200,
                dataIndex: 'sps_ic_number',
                key: 'sps_ic_number',
                className: 'sps_ic_number',
                align:'center',
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
                typecolumn: 'datepicker'
            },
            {
                title:"SOURCE ETA",
                width: 200,
                dataIndex: 'source_eta',
                key: 'source_eta',
                className: 'source_eta',
                align:'center',
                typevalue: 'source_eta',
                typecolumn: 'text'
            },
            {
                title:"ATA",
                width: 200,
                dataIndex: 'actual_time_arrival',
                key: 'actual_time_arrival',
                className: 'actual_time_arrival',
                align:'center',
                typevalue: 'actual_time_arrival',
                typecolumn: 'datepicker'
            },
            {
                title:"ATD",
                width: 200,
                dataIndex: 'actual_discharge',
                key: 'actual_discharge',
                className: 'actual_discharge',
                align:'center',
                typevalue: 'actual_discharge',
                typecolumn: 'datepicker'
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
                     value == '-' ? record.pod.toString() === '' : record.pod
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
                title:"PAYMENT Loc. CHARGES",
                width: 200,
                dataIndex: 'credit_line',
                key: 'credit_line',
                className: 'credit_line',
                align:'center',
            },
            {
                title:"TERMS OF PAYMENT",
                width: 200,
                dataIndex: 'prepaid',
                key: 'prepaid',
                className: 'prepaid',
                align:'center',
            },
            {
                title:"BILLING REQUEST DATE",
                width: 200,
                dataIndex: 'billing_request_date',
                key: 'billing_request_date',
                className: 'billing_request_date',
                align:'center',
                typevalue: 'billing_request_date',
                typecolumn: 'datepicker',
            },
            {
                title:"BILLING RECEIVED DATE",
                width: 200,
                dataIndex: 'billing_received_date',
                key: 'billing_received_date',
                className: 'billing_received_date',
                align:'center',
                typevalue: 'billing_received_date',
                typecolumn: 'datepicker',
            },
            {
                title:"PAYMENT C/O COORDINATOR",
                width: 200,
                dataIndex: 'coordinator_payment_date',
                key: 'coordinator_payment_date',
                className: 'coordinator_payment_date',
                align:'center',
                typevalue: 'coordinator_payment_date',
                typecolumn: 'datepicker',
            },
            // {
            //     title:"REMARKS (COORDINATOR)",
            //     width: 200,
            //     dataIndex: 'coordinator_remarks',
            //     key: 'coordinator_remarks',
            //     className: 'coordinator_remarks'
            // },
            {
                title:"ENDORSE DATE",
                width: 200,
                dataIndex: 'endorse_date',
                key: 'endorse_date',
                className: 'endorse_date',
                align:'center',
                typevalue: 'endorse_date',
                typecolumn: 'datepicker',
            },
            {
                title:"CRO WEB DATE",
                width: 200,
                className: 'cro_web_date',
                align:'center',
                typevalue: 'cro_web_date',
                typecolumn: 'datepicker',
                scopedSlots: {
                    customRender: 'cro_web_date'
                }
            },
            {
                title:"CRO RECEIVING DATE",
                width: 200,
                dataIndex: 'cro_received_date',
                key: 'cro_received_date',
                className: 'cro_received_date',
                align:'center',
                typevalue: 'cro_received_date',
                typecolumn: 'datepicker',
            },
            {
                title:"CRO VALIDITY",
                width: 200,
                dataIndex: 'cro_validity',
                key: 'cro_validity',
                className: 'cro_validity',
                align:'center',
                typevalue: 'cro_validity',
                typecolumn: 'datepicker',
            },
            {
                title:"REASON OF DELAY CRO",
                width: 200,
                dataIndex: 'remarks_others',
                key: 'remarks_others',
                className: 'remarks_others',
                align:'center',
            },
        ]
    }
}

