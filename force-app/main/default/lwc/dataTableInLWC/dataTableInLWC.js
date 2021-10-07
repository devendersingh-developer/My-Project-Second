import { LightningElement,track, wire } from 'lwc';
import getAccountList from '@salesforce/apex/ClsCheckPanCardStatus.getAccountList';

export default class DataTableInLWC extends LightningElement {
@track data;
//Declareing the DataTable Header ///
@track columns=[
{label:'Name', fieldName:'Name' , Type:'text'},
{label:'Phone', fieldName:'Phone' , Type:'text'},
{label:'Industry ', fieldName:'Industry' , Type:'text'},
];


//Calling Data Value from Apex

@wire(getAccountList)
wireDate({error,data}){
  if(data){
    this.data=data;
  }
  if(error){
      this.data=undefined;
      this.error=error;     
  }
}


}