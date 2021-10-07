import { LightningElement, track, wire } from 'lwc';
import Name_Field from '@salesforce/schema/Account.Name';
import sObject from '@salesforce/schema/Account';
import getContactList from '@salesforce/apex/ClsContact.getContactList1';
import MapDemo from '@salesforce/apex/ClsContact.mapDemo';
import GetContactList1 from '@salesforce/apex/ClsContact.getContactList';
import GetContactListButton from '@salesforce/apex/ClsContact.getContactListButton'



export default class ConnectedCallbackExample extends LightningElement {

    @track Name= Name_Field;
    @track sObjectName=sObject;
    @wire(getContactList) contact;

    @track MapDemoRecords;
    @track error;
    @track maps;
    @track SearchText;
    @track lstContacts;
    @track lstContactsButton;
    
   // @wire(MapDemo) MapDemoRecords; 
   /* This is simple way to get the data from apex to lwc 
       but does not handel the error at all */
    
       @wire(MapDemo)
       wrireData({error,data}){
           if(data){
                this.MapDemoRecords=data;
                this.error=undefined;
           }
           if(error){
                this.error=error
                this.MapDemoRecords=undefined;
           }
       }
   
       jsHandelClick(){
        MapDemo().then(result=>{
            console.log('result ---> '+result)
            const options=[];
            for(let key in result){
                if(key){
                    options.push({
                        key: key,
                        value:result[key]
                    });
                }
            }
            this.maps=options;
        }) 
        .catch(error=>{
            this.error=error;
        });
       }
   /*eslint-disable no-console */
   // console.log('Name---> ');

    name = 'Electra X4';
    description = 'A sweet bike built for comfort.';
    category = 'Mountain';
    material = 'Steel';
    price = '$2,700';
    pictureUrl = 'https://s3-us-west-1.amazonaws.com/sfdc-demo/ebikes/electrax4.jpg';
    ready = false;
    connectedCallback(){
        console.log('contact ===> '+this.contact);
        console.log('Name ===> '+this.Name);
        console.log('sObject ===> '+this.sObject); 
        setTimeout(() => 
        {
         this.ready=true;    
        },30000
        );
    }



    @wire(GetContactList1,{
        FirstName : '$SearchText' 
    })
    wireLstContacts({error,data}){
        if(data){
            this.lstContacts=data;
            this.error=undefined;
            console.log(' 82 lstContacts ----> '+this.lstContacts)
         }
         if(error){ 
             this.error=error;
             this.lstContacts=undefined;
         }
    }


    jsHandelChange(event){
        event.preventDefault();
        console.log('Value ----> '+event.target.value);
        this.SearchText=event.target.value;
    }



    /* On Button Click */
    jsHandelButton(){
      GetContactListButton({
        FirstName : this.SearchText
      }).then(result=>{
          console.log(' 110 Button result ---> '+result)
            this.lstContactsButton=result;
      })
      .catch(error=>{
            this.error=error;
      });
    }

contacts=[
    {
    Id :'00076262838238236',
    Name: 'Devender Singh',
    Title: 'Software developer'
    },{
        Id :'00076262838238237',
        Name: 'Anjali Singh',
        Title: 'Software developer'
    },{
        Id :'00076262838238238',
        Name: 'Ghanika Singh',
        Title: 'Software developer'
    },{
        Id :'00076262838238239',
        Name: 'Advik Singh',
        Title: 'Software developer'
    }
    ];
    
}