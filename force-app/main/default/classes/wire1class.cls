public with sharing class wire1class {
    @AuraEnabled(cacheable=true)
    public static list<Account> getaccount(String key)
    {
        string val='%'+key+'%';
        list<account> acc=[SELECT Id, Name, BillingCity FROM Account WHERE Name LIKE :val];
        return acc;
    }
}