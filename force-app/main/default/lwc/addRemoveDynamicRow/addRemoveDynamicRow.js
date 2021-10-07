import { LightningElement, track } from 'lwc';
import saveAccount from '@salesforce/apex/AccountCreationController.CreateAccounts';
import { ShowToastEvent} from 'lightning/platformShowToastEvent';
 
export default class AddRemoveDynamicRow extends LightningElement {
    @track KeyIndex=0;
    @track accountRecList=[ 
        {  
            Name:'',
            Industry:'',
            Phone:''
        }
    ];

   
    changeHandler(event){ 
         if(event.target.name==="accName"){ 
            this.accountRecList[event.target.accessKey].Name=event.target.value;
         }
         else if(event.target.name==="accIndustry"){ 
            this.accountRecList[event.target.accessKey].Industry=event.target.value;
        }
         else if(event.target.name==="accPhone"){ 
            this.accountRecList[event.target.accessKey].Phone=event.target.value;
        }

    }

    addRow(){
        this.KeyIndex+1;
        this.accountRecList.push({ 
            Name: '',
            Industry: '',
            Phone: ''  
        });
    }


    removeRow(event){
        console.log(' 32 accessKey ==> '+event.target.accessKey);
        if(this.accountRecList.length>=1){ 
            this.accountRecList.splice(event.target.accessKey,1);
            this.KeyIndex-1;
        }

    }
    
    SaveMultipleAccounts(){
        saveAccount({AccountList : this.accountRecList}).then(result=>{
            this.message=result;
            this.error=undefined;
            this.accountRecList.forEach( function(item){ 
                item.Name='';
                item.Industry='';
                item.Phone='';
            });
            if(this.message !==undefined){ 
                this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'Account Created',
                            variant: 'success',
                        }),
                );
            }
            console.log('result  --> '+ JSON.stringify(result));
            console.log('Message --> '+this.message);
        })
        .catch(error=>{ 
            this.message=undefined;
            this.error=error;
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error creating records',
                    message: error.body.message,
                    variant: 'error',
                }),
             );
             console.log('error  --> '+ JSON.stringify(this.error));

        });

    }


}