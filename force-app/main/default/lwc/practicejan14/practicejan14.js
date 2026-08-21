import { LightningElement } from 'lwc';

export default class Practicejan14 extends LightningElement 
{
    showcomponent= true;

    onclickhandler()
    {
        if(this.showcomponent == true)
        {
            this.showcomponent = false;
        }
        else{
            this.showcomponent = true;
        }
    }
}