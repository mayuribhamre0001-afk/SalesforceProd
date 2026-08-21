import { LightningElement } from 'lwc';
import login from './Temp1.html';
import signup from './Temp2.html';
import defaultTemp from './multiTempRenderring.html';

export default class MultiTempRenderring extends LightningElement 
{
    clickedOn = 'null';
    onButtonClick(evt)
    {
        this.clickedOn = evt.target.label;
    }
    render()
    {
        if(this.clickedOn == 'Login')
        {
            return login;
        }
        else if(this.clickedOn == 'SignUp')
        {
            return signup;
        }
        else if(this.clickedOn == 'Back')
        {
            return defaultTemp;
        }
        else
        {
            return defaultTemp;
        }
    }
}