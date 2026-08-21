trigger contactAc on Contact (after insert) 
{
    set<Id>allId = new set<Id>{};
    for(contact eachcon : trigger.new)
    {
        if(eachcon.accountid != null)
        {
            allId.add(eachcon.AccountId);
        }
    }
    list<account>AllAcc = [SELECT Id, Has_Contact__c FROM Account WHERE Id IN : allId];
    
    for(account eachAc : AllAcc)
    {
        eachAc.Has_Contact__c= true;
    }
    if(!AllAcc.isempty())
    {
        update AllAcc;
    }
}