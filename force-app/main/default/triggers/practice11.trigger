trigger practice11 on Contact (after insert) 
{
    set<id>AllID = new set<id>{};
    list<account>AllAcc = [select id, Related_contact_count__c from account where id IN : AllID];
    
    for(contact eachcon : trigger.new)
    {
        if(eachcon.AccountId != null)
        {
            AllID.add(eachcon.AccountId);
        }
        for(account eachacc : AllAcc)
        {
            if(eachcon.accountid == eachacc.id)
            {
                eachacc.Related_contact_count__c += 1;
            }
        }
    }
}