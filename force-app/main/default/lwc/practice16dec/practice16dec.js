import { LightningElement, wire} from 'lwc';
import getAccounts from '@salesforce/apex/practice16DecClass.getaccounts';
export default class Practice16dec extends LightningElement 
{
    accounts;
    selectedName;
    selectedIndustry;

    @wire(getAccounts)
    wiredAccounts({ data }) {
        if (data) {
            this.accounts = data;
        }
    }

    handleSelect(event) {
        this.selectedName = event.target.dataset.name;
        this.selectedIndustry = event.target.dataset.industry;
    }
}