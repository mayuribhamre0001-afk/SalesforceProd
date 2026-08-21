import { LightningElement, api, wire } from 'lwc';
import getContacts from '@salesforce/apex/accountController.getContacts';
export default class ContactList extends LightningElement {

    @api accountId;
    contacts;

    @wire(getContacts, { accountId: '$accountId' })
    wiredContacts({ data, error }) {
        if (data) {
            this.contacts = data;
        } else if (error) {
            console.error(error);
        }
    }
}