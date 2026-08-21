import { LightningElement } from 'lwc';
import{ShowToastEvent} from 'lightning/platformShowToastEvent'

export default class NotificationEx extends LightningElement 
{
    onSuccess()
    {
        const noti = new ShowToastEvent({
            title:'Success',
            message:'This is Success Notification',
            variant:'success'
        })
        this.dispatchEvent(noti);
    }
    onError()
    {
        const noti = new ShowToastEvent({
            title:'Error',
            message:'This is Error Notification',
            variant:'error'
        })
        this.dispatchEvent(noti);
    }
    onWarning()
    {
        const noti = new ShowToastEvent({
            title:'Warning',
            message:'This is Warning Notifiaction',
            variant:'warning'
        })
        this.dispatchEvent(noti);
    }
    onInfo()
    {
        const noti = new ShowToastEvent({
            title:'Information',
            message:'This is Information Notification',
            variant:'info'
        })
        this.dispatchEvent(noti);
    }
}