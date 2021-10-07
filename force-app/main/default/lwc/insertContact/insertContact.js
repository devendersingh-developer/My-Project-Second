import {  LightningElement, track,wire } from 'lwc';
import {  ShowToastEvent } from 'lightning/platformShowToastEvent';
import insertCon from '@salesforce/apex/insertObject.insertCon';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import Role_FIELD from '@salesforce/schema/Contact.Role__c';

export default class InsertContact extends LightningElement {
    @track conRecord = CONTACT_OBJECT;
    @track value;

    lstMarkers = [];
    zoomlevel = "1";

    @wire(getPicklistValues, { recordTypeId: '012000000000000AAA', fieldApiName: Role_FIELD })
    propertyOrFunction;

    handleFirstNameChange(event) {
        if(event.target.name==='conFirstName'){
            this.conRecord.FirstName = event.target.value;
            window.console.log('First Name ==> ' + this.conRecord.FirstName);
        }else if(event.target.name==='conLastName'){
            this.conRecord.LastName = event.target.value;
            window.console.log('First Name ==> ' + this.conRecord.FirstName);
        }else if(event.target.name==='conPhone'){
            this.conRecord.Phone = event.target.value;
            window.console.log('First Name ==> ' + this.conRecord.FirstName);
        }else if(event.target.name==='conEmail'){
            this.conRecord.Email = event.target.value;
            window.console.log('First Name ==> ' + this.conRecord.FirstName);
        }
        else if(event.target.name==='conTopSecret'){
            this.conRecord.Top_Secret__c = event.target.value;
            window.console.log(' 24 conTopSecret ==> ' + this.conRecord.Top_Secret__c);
        }
        else if(event.target.name==='progress'){
            this.conRecord.Role__c =  event.target.value;
            window.console.log(' 24 progress ==> ' + event.target.value);
            window.console.log(' 24 progress ==> ' + this.conRecord.Role__c);
        }    
    }
connectedCallback() { 
   // handleClick(){
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(position => {

                // Get the Latitude and Longitude from Geolocation API
                var latitude = position.coords.latitude;
                var longitude = position.coords.longitude;
                
                // Add Latitude and Longitude to the markers list.
                this.lstMarkers = [{
                    location : {
                        Latitude: latitude,
                        Longitude : longitude
                    },
                    title : 'You are here'
                }];
                this.zoomlevel = "4";
            });
        }
    console.log('lstMarkers ----> '+JSON.stringify(this.lstMarkers));
   // }
}

    createRec() {
        window.console.log('In createRec ===> ');
        insertCon({con: this.conRecord})
            .then(result => {
                // Clear the user enter values
                this.conRecord = {};
                window.console.log('result ===> ' + result);
                // Show success messsage
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Success!!',
                    message: 'Contact Created Successfully!!',
                    variant: 'success'
                }), );
            })
            .catch(error => {
                this.error = error.message;
            });
    }
}