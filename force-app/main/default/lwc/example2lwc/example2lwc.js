import { LightningElement, wire} from 'lwc';
import getalldata from '@salesforce/apex/ExampleWireclass2.getallcontacts';

export default class Example2lwc extends LightningElement 
{
    keyword= '';

    listdata;
    errordata;

    columns = [
        {label:'Name', fieldname:'FirstName'},
        {label:'Last Name', fieldname:'LastName'},
        {label:'Phone', fieldname:'Phone'},
        {label:'City', fieldname:'MailingCity'},
    ]

    onChangeHandler(event)
    {
        this.keyword= event.target.value;
    }
    @wire(getalldata, { keyword: '$value' })

    handlewiremethod({error, data})
    {
        if(data)
        {
            this.listdata= data;
        }
        else if(error)
        {
            this.errordata= error;
        }
    }
}