import { LightningElement } from 'lwc';

export default class Practice21April extends LightningElement 
{
       handleClick(event) {
        let message;

        if (event.target.name === 'btn1') {
            message = 'Button 1 clicked';
        } else if (event.target.name === 'btn2') {
            message = 'Button 2 clicked';
        }

        const evt = new CustomEvent('myevent', {
            detail: message
        });

        this.dispatchEvent(evt);
    }
}