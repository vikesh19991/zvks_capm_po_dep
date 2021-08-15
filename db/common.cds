namespace zvks.db.common;

using {
    sap,
    Currency,
    temporal,
    managed
} from '@sap/cds/common';

//------------------------------------------------------------
// Aspects
//------------------------------------------------------------

aspect Amount {
    CURRENCY    : Currency; // CURRENCY_CODE
    GROSS_AMOUNT : AmountType;
    NET_AMOUNT   : AmountType;
    TAX_AMOUNT   : AmountType;
}

//------------------------------------------------------------
// Types
//------------------------------------------------------------
// ...

//------------------------------------------------------------
// Annotations
//------------------------------------------------------------

type AmountType : Decimal(15, 2)@(
    Semantics.amount.currencyCode : 'CURRENCY_CODE',
    sap.unit                      : 'CURRENCY_CODE'
);

annotate common.PhoneNumberType with @(assert.format : '[0-9]' );
annotate common.EmailType with @(assert.format : '^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');