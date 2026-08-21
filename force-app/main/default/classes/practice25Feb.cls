public with sharing class practice25Feb {
    @auraEnabled(cacheable=true)
    public static list<account> getAccount(string val) 
    {
        string key = '%'+val+'%';
        list<account>accList = [SELECT Id, Name, Phone, BillingCity FROM Account WHERE Name LIKE :key];
        return accList;
    }
}