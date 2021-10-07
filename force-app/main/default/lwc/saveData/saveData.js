import { LightningElement, track,api, wire } from 'lwc';
import sObjectValue from '@salesforce/schema/Tax_Form__c'
import objSaveTaxFormRecord from '@salesforce/apex/ClsCheckPanCardStatus.SaveTaxForm';
import objGetTaxFormList from '@salesforce/apex/ClsCheckPanCardStatus.getTaxFormList';


/* ----- START --- The file which is Required for PickList Value --------- */
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import CITY from '@salesforce/schema/Tax_Form__c.City__c';
/* ----- END --- The file which is Required for PickList Value --------- */

/* ----- START --- importing to show toast notifictions -------- ---------- */
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
/* ----- END --- importing to show toast notifictions -------- ---------- */

export default class SaveData extends LightningElement {

    /* ----- START --- This is code for fill up the pick list Value --------- */
    @wire(getObjectInfo, { objectApiName: sObjectValue })
    objectInfo;
    @wire(getPicklistValues, { recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: CITY})
    CityPicklistValues;

@track changeStyle = false;
get className(){
    return this.active ? 'class1': 'class2';
}
@track TextBoxStyle = false;
get classTextBox(){
    return this.active ? 'class3': 'class3';
}
    /* ----- END --- This is code for fill up the pick list Value --------- */
    
    /* -----start----- initialize the field for saving*/
    /*@track TaxFormRecord = {
        Name__c : sObjectValue.Name__c,
        Email__c : sObjectValue.Email__c,
        Address__c : sObjectValue.Address__c
    };*/
   // @track TaxFormRecord = ;
    @track isData=true;
    @track TaxFormRecord;
    @track UpdateTaxFormRecord={'Name__c':'','Email__c':'','Address__c':'','City__c':''};
  // @track UpdateTaxFormRecord=sObjectValue;

    @wire(objGetTaxFormList,({RecordId:'a0d7F00000BUnIZQA1'}))
    wireTaxRecord({error,data}){
        console.log(' 40 Null data ----> '+data)
        if(data==null || data==undefined ||data ==''){
            this.TaxFormRecord =sObjectValue;
            this.isData=false;
            this.isData=true;
            console.log(' 33 Null data ----> '+data)
        }
        else if(data){
            console.log(' 36 data ----> '+JSON.stringify(data));
            this.TaxFormRecord =data[0];
            this.isData=false;
            this.isData=true;
        }
        if(error){
           console.log(' 31 this.error ----> '+this.error)
        }
    }
    /* ---- END----- initialize the field for saving*/
  

    /* -----start----- Event for the textbox value */
    handleNameChange(event) {
        this.UpdateTaxFormRecord.Name__c = event.target.value;
            window.console.log('Name ==> '+this.UpdateTaxFormRecord.Name__c);
    }
    handleEmailChange(event) {
        this.UpdateTaxFormRecord.Email__c = event.target.value;
        window.console.log('Email__c ==> '+this.UpdateTaxFormRecord.Email__c);
    }
    handleAddressChange(event) {
        this.UpdateTaxFormRecord.Address__c = event.target.value;
        console.log('Name ==> '+this.UpdateTaxFormRecord.Address__c);
    }
    handleChange(event) {
        this.UpdateTaxFormRecord.City__c = event.detail.value;
        console.log('City__c ==> '+this.UpdateTaxFormRecord.City__c);
    }


    /* -----END----- Event for the textbox value */

    /* -----start----- Saveing in object */
    jsSaveStatement(){
        objSaveTaxFormRecord({
            objTaxForm:this.UpdateTaxFormRecord
        }).then(result=>{ 
            this.sObjectValue = {};
            this.TaxFormRecord = {};
            this.UpdateTaxFormRecord={};
            console.log(' 40 result ===> '+result);

            this.dispatchEvent(new ShowToastEvent({
                title: 'Success!!',
                message: 'Tax Form Created Successfully!!',
                variant: 'success'
            }),);
        })
        .catch(error=>{ 
            this.error = error.message
            this.dispatchEvent(new ShowToastEvent({
                title: 'Error creating record',
                message: 'Tax Form !!'+this.error,
                variant: 'error'
            }),);
        });
    }
    /* -----END----- Event for the textbox value */
}