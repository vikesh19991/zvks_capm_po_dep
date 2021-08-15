namespace zvks.db.data_view;

// using {
//     zvks.db.data_model.master,
//     zvks.db.data_model.transaction
// } from './data-model';

// context view {

//     //To Do:
//     //Replace joins with UUID

//     define view![C_PurchaseOrders] as
//         select from transaction.purchaseorder {
//             key ID                               as![PurchaseOrderUUID],
//                 PO_NO                            as![PurchaseOrderNo],
//                 BUSINESS_PARTNER.ID              as![PartnerId],
//                 BUSINESS_PARTNER.COMPANY_NAME    as![CompanyName],
//                 GROSS_AMOUNT                     as![POGrossAmount],
//                 CURRENCY.code                    as![POCurrencyCode],
//                 LIFECYCLE_STATUS                 as![POStatus],
//             key ITEMS.ID                         as![POItemUUID],
//                 ITEMS.PO_ITEM_NO                 as![POItemNo],
//                 ITEMS.PRODUCT.PRODUCT_NO         as![ProductNo],
//                 ITEMS.PRODUCT.DESCRIPTION        as![ProductName],
//                 BUSINESS_PARTNER.ADDRESS.CITY    as![City],
//                 BUSINESS_PARTNER.ADDRESS.COUNTRY as![Country],
//                 ITEMS.GROSS_AMOUNT               as![GrossAmount],
//                 ITEMS.NET_AMOUNT                 as![NetAmount],
//                 ITEMS.TAX_AMOUNT                 as![TaxAmount],
//                 ITEMS.CURRENCY.code              as![CurrencyCode],
//         };

//     define view![C_Items] as
//         select from transaction.poitems {
//             PARENT.BUSINESS_PARTNER.BP_NO as![PartnerNo],
//             PRODUCT.PRODUCT_NO            as![ProductNo],
//             CURRENCY.code                 as![CurrencyCode],
//             GROSS_AMOUNT                  as![GrossAmount],
//             NET_AMOUNT                    as![NetAmount],
//             TAX_AMOUNT                    as![TaxAmount],
//             PARENT.OVERALL_STATUS         as![POStatus]
//         };

//     define view![I_ProductsTotal] as
//         select from master.product {
//             PRODUCT_NO        as![ProductNo],
//             texts.DESCRIPTION as![Description],
//             (
//                 select from transaction.poitems {
//                     round(
//                         SUM(
//                             poitems.GROSS_AMOUNT
//                         ), 2
//                     ) as SUM
//                 }
//                 where
//                     poitems.PRODUCT.PRODUCT_NO = product.PRODUCT_NO
//             )                 as![ProductsTotal] : Decimal(10, 2)
//         };

//     define view![C_Products] as
//         select from master.product
//         mixin {
//             //Check if _Items_ID field will be created
//             _Items        : Association[ * ] to C_Items
//                                 on _Items.ProductNo = $projection.ProductNo;
//             _ProductTotal : Association[ * ] to I_ProductsTotal
//                                 on _ProductTotal.ProductNo = $projection.ProductNo
//         }
//         into {
//             PRODUCT_NO                  as![ProductNo],
//             DESCRIPTION                 as![Decription],
//             CATEGORY                    as![Category],
//             PRICE                       as![Price],
//             TYPE_CODE                   as![TypeCode],
//             SUPPLIER.BP_NO              as![BPNo],
//             SUPPLIER.COMPANY_NAME       as![CompanyName],
//             SUPPLIER.ADDRESS.CITY       as![City],
//             SUPPLIER.ADDRESS.COUNTRY    as![Country],
//             _ProductTotal.ProductsTotal as![ProductsTotal],
//             //Exposed Association, which means when someone read the view
//             //the data for orders wont be read by default
//             //until unless someone consume the association
//             _Items
//         };
// }

// context valuehelp {
//     define view![C_ProductsTotalVH] as
//         select from view.C_Products {
//             ProductNo,
//             Country,
//             _Items.CurrencyCode as![CurrencyCode],
//             round(
//                 //sum(PO_ORDERS.GrossAmount), 2
//             )                   as![POGrossAmount] : Decimal(10, 2)
//         }
//         group by
//             ProductNo,
//             Country,
//             _Items.CurrencyCode;

//     define view![C_ProductVH] as
//         select from master.product {
//             // @EndUserText.label : [{
//             //     language : 'EN',
//             //     text     : 'Product ID'
//             // }, {
//             //     language : 'DE',
//             //     text     : 'Prodekt ID'
//             // }]
//             PRODUCT_NO  as![ProductNo],
//             // @EndUserText.label : [{
//             //     language : 'EN',
//             //     text     : 'Product Description'
//             // }, {
//             //     language : 'DE',
//             //     text     : 'Prodekt Description'
//             // }]
//             DESCRIPTION as![Description]
//         };

//     define view CProductValuesView as
//         select from view.C_Products{
//             ProductNo as ![ProductNo],
//             Country as ![Country],
//             _Items.CurrencyCode as![CurrencyCode],
//             round(
//                 sum(_Items.GrossAmount), 2
//             )
//             as![POGrossAmount] : Decimal(10, 2)
//         }
//         group by
//             ProductNo,
//             Country,
//             _Items.CurrencyCode;

// }
