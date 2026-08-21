import { LightningElement, wire } from 'lwc';
import getcon from '@salesforce/apex/practice14May.getcontact';
export default class Practice14May extends LightningElement 
{
    key='';
    data;
    error;
  
    column=[
        {label:'Id', fieldName:'Id'},
        {label:'First Name', fieldName:'FirstName'},
        {label:'Last Name', fieldName:'LastName'},
        {label:'Email', fieldName:'Email'},
        {label:'Phone', fieldName:'Phone'}
    ];
    handlechange(event)
    {
        this.key = event.target.value;
    }
    @wire(getcon,{key:'$key'})
    wiredCon({data, error})
    {
        if(data)
        {
            this.data = data;
            this.error = undefined;
        }
        else{
            this.error = error;
            this.data = undefined;
        }
    }
}