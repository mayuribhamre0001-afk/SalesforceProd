public with sharing class practice14May 
{
    @auraEnabled(cacheable=true)
    public static list<contact> getcontact(string key) 
    {
         if(String.isBlank(key))
        {
            return new List<Contact>();
        }

        string val = '%'+key+'%';
        list<contact>allCon = [SELECT Id, FirstName, LastName, Email, Phone FROM Contact WHERE Account.Name LIKE:val];
        return allCon;
    }
}