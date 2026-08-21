import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/imperativeClass.getAllAcc';
export default class ImperativeEx extends LightningElement 
{
    searchkey='';
    datalist;
    errordata;
    clm=[
        {label:'Name', fieldName:'Name'},
        {label:'Phone', fieldName:'Phone'},
        {label:'City', fieldName:'Billingcity'},
        {label:'Account Id', fieldName:'Id'}
    ];
    onchangeHandler(evt)
    {
        this.searchkey=evt.target.value;
    }
    onButtonClick(){
        getAccounts({key:this.searchkey})
        .then(result => {
            this.datalist=result;
        })
        .catch(error =>{
            this.errordata=error;
        });
    }
}