namespace zvks.db.data_model;

using {
    cuid,
    Currency
} from '@sap/cds/common';

using {zvks.db.common} from './common';

context master {

    // zvks.db.data_model.master-businesspartner
    entity businesspartner : cuid {
        BP_NO         : String(32);
        BP_ROLE       : String(2);
        COMPANY_NAME  : String(250);
        EMAIL_ADDRESS : String(105);
        PHONE_NUMBER  : String(32);
        FAX_NUMBER    : String(32);
        WEB_ADDRESS   : String(44);
        ADDRESS       : Association to master.address; //ADDRESS_ID field and ADDRESS association
    }

    // zvks.db.data_model.master-address
    entity address : cuid {
        CITY             : String(44);
        POSTAL_CODE      : String(8);
        STREET           : String(44);
        BUILDING         : String(128);
        COUNTRY          : String(44);
        ADDRESS_TYPE     : String(44);
        VAL_START_DATE   : Date;
        VAL_END_DATE     : Date;
        LATITUDE         : Decimal;
        LONGITUDE        : Decimal;
        BUSINESS_PARTNER : Association to one master.businesspartner
                               on BUSINESS_PARTNER.ADDRESS = $self;
    }

    // zvks.db.data_model.master-product
    entity product : cuid {
        PRODUCT_NO     : String(28);
        TYPE_CODE      : String(2);
        CATEGORY       : String(32);
        // DESCRIPTION
        DESCRIPTION    : localized String(255); // zvks.db.data_model.master-product_texts
        SUPPLIER       : Association to master.businesspartner; // SUPPLIER_ID field and SUPPLIER association
        TAX_TARIF_CODE : Integer;
        MEASURE_UNIT   : String(2);
        WEIGHT_MEASURE : Decimal;
        WEIGHT_UNIT    : String(2);
        CURRENCY       : Currency; // CURRENCY_CODE
        PRICE          : Decimal(15, 2);
        WIDTH          : Decimal;
        DEPTH          : Decimal;
        HEIGHT         : Decimal;
        DIM_UNIT       : String(2);
    }
}

context transaction {

    // zvks.db.data_model.transaction-purchaseorder
    entity purchaseorder : cuid, common.Amount {
        PO_NO                 : String(24);
        // BUSINESS_PARTNER & BUSINESS_PARTNER_ID
        BUSINESS_PARTNER      : Association to master.businesspartner;
        LIFECYCLE_STATUS      : String(1);
        LIFECYCLE_CRITICALITY : Integer;
        OVERALL_STATUS        : String(1);
        // ITEMS &
        ITEMS                 : Composition of many poitems // Composition to PO Item: PO Item cannnot exist without PO
                                    on ITEMS.PARENT = $self;
        NOTE                  : String(256);
    }

    // zvks.db.data_model.transaction-poitems
    entity poitems : cuid, common.Amount {
        // PARENT & PARENT_ID
        PARENT     : Association to transaction.purchaseorder;
        PO_ITEM_NO : Integer;
        PRODUCT    : Association to master.product; // PRODUCT_ID field and PRODUCT association
    }
}
