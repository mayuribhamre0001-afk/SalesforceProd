import { LightningElement } from 'lwc';

export default class ConditionalRendering extends LightningElement 
{
    logintemp = false;
    signuptemp = false;
    welcometemp = false;
    showtemp = true;

    loginclick()
    {
        this.logintemp = true;
        this.signuptemp = false;
        this.welcometemp = false;
        this.showtemp = false;
    }
    signupclick()
    {
        this.signuptemp = true;
        this.logintemp = false;
        this.welcometemp = false;
        this.showtemp = false;
    }
    logindone()
    {
        this.welcometemp = true;
        this.logintemp = false;
        this.signuptemp = false;
        this.showtemp = false;
    }
    goback()
    {
        this.showtemp = true;
        this.logintemp = false;
        this.signuptemp = false;
        this.welcometemp = false;
    }
}