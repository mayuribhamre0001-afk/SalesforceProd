import { LightningElement } from 'lwc';

export default class NestedTemplates extends LightningElement 
{
    temp1 = false;
    temp2 = false;

    onButton1Click()
    {
        this.temp1 = true;
        this.temp2 = false;
    }

    onButton2Click()
    {
        this.temp1 = false;
        this.temp2 = true;
    }
}