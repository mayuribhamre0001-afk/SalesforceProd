public with sharing class accountController {

    @AuraEnabled(cacheable=true)
    public static Id getAccountId(String name) {
       
    List<Account> accList = [
        SELECT Id FROM Account WHERE Name = :name LIMIT 1];

        return accList.isEmpty() ? null : accList[0].Id;
        }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(Id accountId) {
        return [SELECT Id, Name, Email 
                FROM Contact 
                WHERE AccountId = :accountId];
    }
}