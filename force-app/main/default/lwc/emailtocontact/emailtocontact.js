import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import sendemailtocontact from '@salesforce/apex/emailclass.sendEmail';

export default class Emailtocontact extends LightningElement 
{
    @api recordId;
    emailSubject = '';
    emailBody = '';

    handleSubjectChange(evt)
    {
        this.emailSubject= evt.target.value;
    }
    handleBodyChange(evt)
    {
        this.emailBody= evt.target.value;
    }
    onButtonClick()
    {
        if(!this.emailSubject || !this.emailBody)
        {
            this.dispatchEvent(
                new ShowToastEvent({
                    title:'Error',
                    message:'Subject and Body are Required',
                    variant:'error'
                })
            )
            return;
        }
        sendemailtocontact({
            contactId:this.recordId, 
            Subject:this.emailSubject, 
            Body:this.emailBody
        })
        .then(()=>{
            
            this.dispatchEvent(
               new ShowToastEvent({
                    title:'Success',
                    message:'Email sent successfully',
                    variant:'success'
                })
            );
           
            this.emailSubject = '';
            this.emailBody = '';
        })
        .catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error sending email',
                    message: error.body ? error.body.message : error.message,
                    variant: 'error'
                })
            );
        });
    }

}