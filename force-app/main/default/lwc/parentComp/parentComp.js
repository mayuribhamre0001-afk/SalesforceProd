import { LightningElement } from 'lwc';

export default class ParentComp extends LightningElement 
{
    searchvalparent = '';
    handelsearchval(evt)
    {
        this.searchvalparent = evt.detail;
    }
}