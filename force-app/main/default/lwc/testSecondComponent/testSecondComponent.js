import { LightningElement, track, api } from 'lwc';

export default class TestSecondComponent extends LightningElement {

    @api Name='Devender Singh';
    @track Title='Software developer';
    Phone='9971602208';
    Email='Devenders843@gmail.com';
    handelClick(){

        this.Name='Anjali Singh W/o Devender Singh';
        this.Phone='9971602209';
    }
}