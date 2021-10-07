declare module "@salesforce/apex/OpportunityLineItemController.getOpportLineunity" {
  export default function getOpportLineunity(): Promise<any>;
}
declare module "@salesforce/apex/OpportunityLineItemController.getProduct" {
  export default function getProduct(): Promise<any>;
}
declare module "@salesforce/apex/OpportunityLineItemController.SearchProduct" {
  export default function SearchProduct(param: {strKeyword: any, selectedProduct: any}): Promise<any>;
}
declare module "@salesforce/apex/OpportunityLineItemController.AddProduct" {
  export default function AddProduct(param: {OppId: any, selectedProduct: any}): Promise<any>;
}
declare module "@salesforce/apex/OpportunityLineItemController.SaveOpportunityLine" {
  export default function SaveOpportunityLine(param: {OpportunityLine: any}): Promise<any>;
}
