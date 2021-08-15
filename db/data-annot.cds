namespace zvks.db.data_annot;

using {
    zvks.db.data_model.master,
    zvks.db.data_model.transaction
} from './data-model';

// using {zvks.db.data_view.valuehelp} from './data-view';

//------------------------------------------------------------------
// zvks.db.data_model.master
//------------------------------------------------------------------

annotate master.businesspartner with {
    BP_NO         @title : '{i18n>BP_NO}';
    BP_ROLE       @title : '{i18n>BP_ROLE}';
    COMPANY_NAME  @title : '{i18n>BP_COMPANY_NAME}';
    EMAIL_ADDRESS @title : '{i18n>BP_EMAIL_ADDRESS}';
    PHONE_NUMBER  @title : '{i18n>BP_PHONE_NUMBER}';
    FAX_NUMBER    @title : '{i18n>BP_FAX_NUMBER}';
    WEB_ADDRESS   @title : '{i18n>BP_WEB_ADDRESS}';
    ADDRESS       @title : '{i18n>BP_ADDRESS}';
    //cuid
    ID            @title : '{i18n>BP_CUID}';
};

annotate master.address with {
    CITY             @title : '{i18n>ADR_CITY}';
    POSTAL_CODE      @title : '{i18n>ADR_POSTAL_CODE}';
    STREET           @title : '{i18n>ADR_STREET}';
    BUILDING         @title : '{i18n>ADR_BUILDING}';
    COUNTRY          @title : '{i18n>ADR_COUNTRY}';
    ADDRESS_TYPE     @title : '{i18n>ADR_ADDRESS_TYPE}';
    VAL_START_DATE   @title : '{i18n>ADR_VAL_START_DATE}';
    VAL_END_DATE     @title : '{i18n>ADR_VAL_END_DATE}';
    LATITUDE         @title : '{i18n>ADR_LATITUDE}';
    LONGITUDE        @title : '{i18n>ADR_LONGITUDE}';
    BUSINESS_PARTNER @title : '{i18n>ADR_BUSINESS_PARTNER}';
    //cuid
    ID               @title : '{i18n>ADR_CUID}';
};

annotate master.product with {
    PRODUCT_NO     @title : '{i18n>PRD_PRODUCT_NO}';
    TYPE_CODE      @title : '{i18n>PRD_TYPE_CODE}';
    CATEGORY       @title : '{i18n>PRD_CATEGORY}';
    DESCRIPTION    @title : '{i18n>PRD_DESCRIPTION}';
    SUPPLIER       @title : '{i18n>PRD_SUPPLIER}';
    TAX_TARIF_CODE @title : '{i18n>PRD_TAX_TARIF_CODE}';
    MEASURE_UNIT   @title : '{i18n>PRD_MEASURE_UNIT}';
    WEIGHT_MEASURE @title : '{i18n>PRD_WEIGHT_MEASURE}';
    WEIGHT_UNIT    @title : '{i18n>PRD_WEIGHT_UNIT}';
    CURRENCY       @title : '{i18n>PRD_CURRENCY}';
    PRICE          @title : '{i18n>PRD_PRICE}';
    WIDTH          @title : '{i18n>PRD_WIDTH}';
    DEPTH          @title : '{i18n>PRD_DEPTH}';
    HEIGHT         @title : '{i18n>PRD_HEIGHT}';
    DIM_UNIT       @title : '{i18n>PRD_DIM_UNIT}';
    //cuid
    ID             @title : '{i18n>PRD_CUID}';
};

//------------------------------------------------------------------
// zvks.db.data_model.transaction
//------------------------------------------------------------------
@title :                      '{i18n>PO_HEADER}'
annotate transaction.purchaseorder with {
    PO_NO            @title : '{i18n>PO_PO_NO}';
    BUSINESS_PARTNER @title : '{i18n>PO_BUSINESS_PARTNER}';
    LIFECYCLE_STATUS @title : '{i18n>PO_LIFECYCLE_STATUS}';
    OVERALL_STATUS   @title : '{i18n>PO_OVERALL_STATUS}';
    ITEMS            @title : '{i18n>PO_ITEMS}';
    NOTE             @title : '{i18n>PO_NOTE}';
    //cuid
    ID               @title : '{i18n>PO_CUID}';
    //common.Amount
    GROSS_AMOUNT     @title : '{i18n>PO_GROSS_AMOUNT}';
    NET_AMOUNT       @title : '{i18n>PO_NET_AMOUNT}';
    TAX_AMOUNT       @title : '{i18n>PO_TAX_AMOUNT}';
    CURRENCY         @title : '{i18n>PO_CURRENCY}';
};

@title :                  '{i18n>POI_HEADER}'
annotate transaction.poitems with {
    PARENT       @title : '{i18n>POI_PARENT}';
    PO_ITEM_NO   @title : '{i18n>POI_PO_ITEM_NO}';
    PRODUCT      @title : '{i18n>POI_PRODUCT}';
    //cuid
    ID           @title : '{i18n>POI_CUID}';
    // common.Amount
    GROSS_AMOUNT @title : '{i18n>POI_GROSS_AMOUNT}';
    NET_AMOUNT   @title : '{i18n>POI_NET_AMOUNT}';
    TAX_AMOUNT   @title : '{i18n>POI_TAX_AMOUNT}';
    CURRENCY     @title : '{i18n>POI_CURRENCY}';
};

// //------------------------------------------------------------------
// // zvks.db.data_view.valuehelp
// //------------------------------------------------------------------
// annotate valuehelp.ProductValueHelp with {
//     ProductId
// };
