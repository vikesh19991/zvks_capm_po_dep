using {zvks.srv.po_service.PurchaseOrderSRV} from './po-service';

@path : '/PurchaseOrderSRV'
annotate PurchaseOrderSRV with {};

annotate PurchaseOrderSRV.AddressSet with {
    @UI.Hidden : true
    ID;
};

annotate PurchaseOrderSRV.ProductSet with {
    @UI.Hidden        : true
    ID;
    @Common.ValueList : {
        $Type          : 'Common.ValueListType',
        CollectionPath : 'ProductSet',
        Label          : 'Prodcut No.',
        Parameters     : [
            {
                $Type             : 'Common.ValueListParameterOut',
                LocalDataProperty : PRODUCT_NO,
                ValueListProperty : 'PRODUCT_NO',
            },
            {
                $Type             : 'Common.ValueListParameterOut',
                LocalDataProperty : DESCRIPTION,
                ValueListProperty : 'DESCRIPTION',
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'CATEGORY',
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'SUPPLIER_ID',
            }
        ]
    }
    PRODUCT_NO;
};

annotate PurchaseOrderSRV.BPSet with {
    @UI.Hidden : true
    ID;
};

@odata.draft.enabled : true
annotate PurchaseOrderSRV.POSet with {
    @UI.Hidden           : true
    ID;

    @UI.Hidden           : true
    BUSINESS_PARTNER;

    // @title               : '{i18n>POSET_GROSS_AMOUNT}'
    // GROSS_AMOUNT;

    @title               : '{i18n>POSET_LIFECYCLE_STATUS}'
    LIFECYCLE_STATUS;

    @UI.Hidden           : true
    LIFECYCLE_CRITICALITY;
} actions {
    @Title               : '{i18n>POSET_BOOST}'
    boost
};

annotate PurchaseOrderSRV.POItemsSet with {
    @UI.Hidden : true
    ID;
    @UI.Hidden : true
    PARENT;
    @UI.Hidden : true
    PRODUCT;
}
