trigger accountInsudtry on Contact (before insert)
{
    set<Id>AccId = new set<Id>{};
        
    for(contact con : trigger.new)
    {
        if(con.accountId != null)
        {
            AccId.add(con.accountId);
        }
    }
    map<id, account> AllAcc = new map<id, account>(
    [SELECT Id, Industry FROM Account WHERE Id IN : AccId]
    );
    
    for(contact con : trigger.new)
    {
        if(con.AccountId != null && con.Industry__c == null)
        {
            account acc = AllAcc.get(con.AccountId);
            if(acc != null && acc.Industry != null)
            {
                con.Industry__c = acc.Industry;
            }
        }
    }
}