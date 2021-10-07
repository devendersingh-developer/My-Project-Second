declare module "@salesforce/apex/ClsContact.mapDemo" {
  export default function mapDemo(): Promise<any>;
}
declare module "@salesforce/apex/ClsContact.getContactList1" {
  export default function getContactList1(): Promise<any>;
}
declare module "@salesforce/apex/ClsContact.getContactList" {
  export default function getContactList(param: {FirstName: any}): Promise<any>;
}
declare module "@salesforce/apex/ClsContact.getContactListButton" {
  export default function getContactListButton(param: {FirstName: any}): Promise<any>;
}
declare module "@salesforce/apex/ClsContact.getContact" {
  export default function getContact(param: {pageNumber: any, recordToDisply: any}): Promise<any>;
}
declare module "@salesforce/apex/ClsContact.getContactSearch" {
  export default function getContactSearch(param: {strSearchText: any, pageNumber: any, recordToDisply: any}): Promise<any>;
}
