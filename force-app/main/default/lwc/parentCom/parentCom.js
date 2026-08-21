import { LightningElement } from 'lwc';

export default class ParentCom extends LightningElement {
    
    message;
    handleEvent(event)
    {
        this.message = event.detail;
    }

}