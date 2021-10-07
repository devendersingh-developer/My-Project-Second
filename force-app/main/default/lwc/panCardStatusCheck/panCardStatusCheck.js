import { LightningElement,api,wire,track } from 'lwc';
import GetAccountList from '@salesforce/apex/ClsCheckPanCardStatus.getAccountList';

export default class PanCardStatusCheck extends LightningElement {

    panNumber;// for storing PAN
    @track panerror=false;
    @api accId;
    jsHandlerPanCrad(event){
        if(event.target.value != null)
        this.panNumber=event.target.value;
        console.log('pan no'+this.panNumber);
    }

    jsHandelOnCheck(){
        console.log('PAn'+this.panNumber);
        if (/([A-Z]){5}([0-9]){4}([A-Z]){1}$/.test(this.panNumber.toUpperCase())) {
            this.panerror=false;
            GetAccountList({sPanCardNumber: this.panNumber}).then(result=>{
                console.log('line result 20 --> '+result[0].Name);
                console.log('Result ---> '+JSON.stringify(result));
            })
            .catch(error=>{
                this.error = error;
                console.log('line number 24 --> '+this.error);
            })
        }else{
            this.panerror=true;
        }
    }
}