import { LightningElement, wire } from 'lwc';
import getList from '@salesforce/apex/practice25Feb.getAccount';
export default class Practice25Feb extends LightningElement 
{
    val;
    data;
    error;
    col = [
        {label:'Name', fieldName:'Name'},
        {label:'Phone', fieldName:'Phone'},
        {label:'City', fieldName:'BillingCity'},
    ];

    handleChange(event)
    {
        this.val = event.target.value;
    }
    @wire(getList, {val:'$val'})
    wiredaccount({error, data})
    {
        if(data)
        {
            this.data = data;
        }
        else if(error)
        {
            this.error = error;
        }
    }
}