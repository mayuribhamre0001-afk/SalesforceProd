import { LightningElement, wire} from 'lwc';
import getAccount from '@salesforce/apex/wire1class.getaccount';

export default class Wire1 extends LightningElement 
{
    searchkey='';
    data;
    errormsg;

    columns=[
        {label:'Account Name', fieldName:'Name'},
        {label:'Account City', fieldName:'BillingCity'},
        {label:'Account Id', fieldName:'Id'},
    ]
    onchangeHandler(event)
    {
        this.searchkey=event.target.value;
    }
    @wire(getAccount,{key:'$searchkey'})
    getdata({error,data})
    {
        if(data)
        {
            this.data=data;
        }
        else if(error)
        {
            this.errormsg=error;
        }
    }
}