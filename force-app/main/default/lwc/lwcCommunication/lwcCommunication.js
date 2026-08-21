import { LightningElement } from 'lwc';

export default class LwcCommunication extends LightningElement 
{
    message ='';
    handledata(evt)
    {
        this.message = evt.target.value;
    }
}