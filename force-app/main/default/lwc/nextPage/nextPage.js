import { LightningElement,track } from 'lwc';

export default class NextPage extends LightningElement {

   @track iPage=1;

   jsHandelNext(){
        this.iPage=this.iPage+1;
    }
    jsHandelPrevious(){
        if(  this.iPage>1){
            this.iPage=  this.iPage-1;
        }
    }
}