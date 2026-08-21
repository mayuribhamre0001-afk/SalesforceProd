public with sharing class imperativeClass 
{
    @AuraEnabled
    public static list<account> getAccount(string key) 
    {
        string val = '%'+key+'%';
        list<account>accList = [SELECT Id, Name, Phone, BillingCity FROM Account WHERE Name LIKE : val];
        return accList;
    }
}