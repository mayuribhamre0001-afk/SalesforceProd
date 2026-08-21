public with sharing class ExampleWireclass2 {
  
    @AuraEnabled(cacheable=true)
  
    public static list<contact> getallcontacts(string value)
    {
        string var1 = '%'+value+'%';
        list<contact> Allcon = [select firstname, lastname, id, phone, email, mailingcity from contact where lastname like :var1];
        return Allcon;
    }
}