import { LightningElement, api, wire } from 'lwc';

import { getRecord } from 'lightning/uiRecordApi';

import NAME_FIELD from '@salesforce/schema/Contact.Name';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';

const FIELDS = [NAME_FIELD, EMAIL_FIELD];

export default class LdsPractice extends LightningElement {
    @api recordId; 

   @wire(getRecord, {
    recordId : '$recordId',
    fields : FIELDS
   })
   contact;
  get name() {
    return this.contact?.data?.fields?.Name?.value || '';
}

get email() {
    return this.contact?.data?.fields?.Email?.value || '';
}
}