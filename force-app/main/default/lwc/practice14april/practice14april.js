import { LightningElement} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getcon from '@salesforce/apex/practice14april.getContact';
import { deleteRecord } from 'lightning/uiRecordApi';
import{ ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class practice14april extends NavigationMixin(LightningElement)
{
    key='';
    data;
    error;

    handlechange(evt)
    {
        this.key = evt.target.value;
    }
    column = [
        {label:'First Name', fieldName:'FirstName'},
        {label:'Last Name', fieldName:'recordLink',
            type:'url',
            typeAttributes:{
                label:{fieldName:'LastName'},
                target:'_blank'
            }
        },
        {label:'Email', fieldName:'Email'},
        
        {type:'button',
            typeAttributes:{
                label:'Delete',
                name:'delete',
                variant:'destructive'
            }
        }
    ];
   handlesearch() {
        getcon({ key: this.key })
            .then(result => {
                this.data = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error;
                this.data = undefined;
            });
    }
   
rowactionhandler(event) {
    const actionName = event.detail.action.name;
    const row = event.detail.row;

    if(actionName === 'view'){
    this[NavigationMixin.Navigate]({
        type: 'standard__recordPage',
        attributes: {
            recordId: row.Id,
            objectApiName: 'Contact',
            actionName: 'view'
        }
    });
}
else if(actionName === 'delete'){
    this.deleteContact(row.Id);
}
}
deleteContact(recordId){
    deleteRecord(recordId)
    .then(()=>{
        this.dispatchEvent(
            new ShowToastEvent({
                title:'Success',
                message:'Contact deleted successfully',
                variant:'success'
            })
        );
        this.handlesearch();
    })
    .catch(error=>{
        this.dispatchEvent(
            new ShowToastEvent({
                title:'Error',
                message:error.body.message,
                variant:'error'
            })
        );
    });
}
}