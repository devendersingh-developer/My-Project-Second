import { LightningElement, api, track,wire } from 'lwc';
import getCustomList from '@salesforce/apex/LwcLegalRegistration.fmcGetUserDetails'; 
export default class LWC_List_Page extends LightningElement {
@track valueRefresh;
@track RecordId;
@track ListOfUserDetails=[];

connectedCallback() { 
 getCustomList()
.then(result => {
if (result) {
    let tempData = JSON.parse(JSON.stringify(result));
    for (let i = 0; i < tempData.length; i++) {
        this.ListOfUserDetails.push(tempData[i]);
    }
    this.error = undefined;
    console.log('This is Question-->> '+this.ListOfUserDetails);
} else if (error) {
    this.error = error;
    this.ListOfUserDetails = undefined;
}
})
.catch(error => {
this.error = error;
});
}


openModal(event) {
    event.preventDefault();
    event.stopPropagation();
   // alert("currentTarget *****>>>>>> "+event.currentTarget.dataset);
   // alert("value 111 *****>>>>>> "+event.target.dataset.recordId)
    alert("Id 121 *****>>>>>> "+event.currentTarget.dataset.recordId)
    this.RecordId = event.currentTarget.dataset.recordId;
    alert('Record id '+this.RecordId)
}
}