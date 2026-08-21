public with sharing class practice14april {
    @auraEnabled
    public static list<contact> getContact(string key) 
    {
        string val = '%'+key+'%';
        list<contact>conList = [SELECT Id, FirstName, LastName, Email, Account.Name FROM Contact WHERE Account.Name LIKE : val];
        return conList;
    }
}