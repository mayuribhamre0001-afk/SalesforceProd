import { LightningElement } from 'lwc';

export default class ChildComp extends LightningElement 
{
    searchKey='';
    handlechange(evt)
    {
        this.searchKey=evt.target.value;

        const searchEvent = new CustomEvent("getsearchval",{
            detail : this.searchKey
        });
        this.dispatchEvent(searchEvent);
    }
}