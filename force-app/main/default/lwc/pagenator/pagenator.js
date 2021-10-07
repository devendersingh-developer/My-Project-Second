import { LightningElement } from 'lwc';

export default class Pagenator extends LightningElement {

    jsHandelNext(){
     const nextEvent= new CustomEvent('next');
     this.dispatchEvent(nextEvent);
    }

    jsHandelPrevious(){
        const prevEvent= new CustomEvent('previous');
        this.dispatchEvent(prevEvent);       
    }
}