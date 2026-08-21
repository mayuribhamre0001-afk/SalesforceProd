import { LightningElement } from 'lwc';
import getAccount from '@salesforce/apex/wireExample.getAccount';
export default class WireExampleMarch15 extends LightningElement 
{
    key = '';
    accounts;
    error;
    
    columns =[
        {label:'Account Name', fieldName:'Name'},
        {label:'Account Id', fieldName:'Id'}
    ];
    changehandler(event)
    {
        this.key = event.target.value;
    }
    
    clickhandler()
    {
        getAccount({key:this.key})
        .then(result=>
        {
            this.accounts = result;
            this.error = undefined;
        })
        .catch(error=>
        {
            this.error = error;
            this.accounts = undefined;
        })
    }
}