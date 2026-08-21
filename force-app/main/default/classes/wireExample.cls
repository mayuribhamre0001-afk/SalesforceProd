public with sharing class wireExample 
{
    @auraEnabled
    public static list<account> getAccount(string key) 
    {
        string value = '%'+key+'%';
        list<account>accList = [SELECT Id, Name FROM Account WHERE Name LIKE :value];
        return accList;
    }
}