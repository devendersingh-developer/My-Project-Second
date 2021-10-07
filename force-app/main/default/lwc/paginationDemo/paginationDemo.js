import { LightningElement , track,wire,api } from 'lwc';
import getDataList from '@salesforce/apex/ClsCheckPanCardStatus.getAccountList1';

export default class PaginationDemo extends LightningElement {

    totalAccounts;
    @wire(getDataList)
    wireDataList({error,data}){ 
        if(data){ 
            this.totalAccounts=data;
            console.log('totalAccounts ----> '+this.totalAccounts)
        }
        if(error){ 
            console.log(' 14 error'+this.errot);
        }
    }

}