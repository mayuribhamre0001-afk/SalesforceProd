public with sharing class practice16DecClass 
{
    @AuraEnabled(cacheable=true)
    public static list<account> getaccounts(string key)   
    {
        string val = '%' +key+'%';
        list<account>acclist = [SELECT Id, Name, Phone, Industry FROM Account WHERE Name LIKE : val];
        return acclist;
    }
}