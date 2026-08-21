import { LightningElement } from 'lwc';
import getAccountId from '@salesforce/apex/accountController.getAccountId';
export default class Parent extends LightningElement {

    accountName = '';
    accountId;

    handleChange(event) {
        this.accountName = event.target.value;

        // Call Apex to get Account Id
        getAccountId({ name: this.accountName })
            .then(result => {
                this.accountId = result;
            })
            .catch(error => {
                console.error(error);
            });
    }
}