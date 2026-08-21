import { LightningElement } from 'lwc';
import getList from '@salesforce/apex/imperativeClass.getAccount';
export default class ImperativeMethod extends LightningElement 
{
    data;
    error;
    val;
    columns =[
        {label:'Name', fieldName:'Name'},
        {label:'Phone', fieldName:'Phone'},
        {label:'BillingCity', fieldName:'BillingCity'}
    ];

    changeHandler(evt)
    {
        this.val = evt.target.value;
    }
    clickHandler()
    {
        getList({key:this.val})
        .then(result=>{
            this.data = result;
            this.error = undefined;
        })
        .catch(error=>{
            this.error = error;
            this.data = undefined;
        })
    }
}