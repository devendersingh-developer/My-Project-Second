import { LightningElement, track,wire } from 'lwc';
import retriveCons from '@salesforce/apex/AccountCreationController.getContacts';

export default class SelectionRecordFromTableCmp extends LightningElement {
    @track data = [];
    @track error;
    @track bShowModal = false;
    @track selectedCons;

    @wire(retriveCons)
    contacts(result) {
        if (result.data) {
            this.data = result.data;
            this.error = undefined;

        } else if (result.error) {
            this.error = result.error;
            this.data = undefined;
        }
    }




    allSelected(event) {
        let selectedRows = this.template.querySelectorAll('lightning-input');
        
        for(let i = 0; i < selectedRows.length; i++) {
            if(selectedRows[i].type === 'checkbox') {
                selectedRows[i].checked = event.target.checked;
                console.log('Record id -->'+ selectedRows[i].dataset.id);                
            }
        }
    }
   

    showContacts(){ 
        this.selectedCons = [];
        let selectedRows = this.template.querySelectorAll('lightning-input');

        for(let i = 0; i < selectedRows.length; i++) {
            if(selectedRows[i].checked && selectedRows[i].type === 'checkbox') {
                console.log(' 41 Record id -->'+ selectedRows[i].dataset.id);
                console.log(' 44 value id -->'+ selectedRows[i].value);
                this.selectedCons.push({
                    Name: selectedRows[i].value,
                    Id: selectedRows[i].dataset.id
                })
            }
        }
        console.log(' 51 value id -->'+this.selectedCons);
    }
   
    
}