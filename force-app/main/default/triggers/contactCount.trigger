trigger contactCount on Contact (after insert, after update, after delete, after undelete) 
{
    set<Id>AllId = new set<Id>{};
   if(trigger.isinsert || trigger.isundelete)
   { 
       for(contact eachcon : trigger.new)
        {
            if(eachcon.accountId != null)
            {
                AllId.add(eachcon.accountId);
            }
        }
   }
    if(trigger.isupdate)
    {
        for(contact eachcon : trigger.new)
        {
            contact oldcon = trigger.oldmap.get(eachcon.id);
            if(eachcon.AccountId!=oldcon.AccountId)
            {
                if(eachcon.AccountId != null)
                {
                    AllId.add(eachcon.AccountId);
                }
                if(oldcon.AccountId != null)
                {
                    AllId.add(oldcon.AccountId);  
                }
            }
        }
    }
    if(trigger.isdelete)
    {
        for(contact eachcon : trigger.old)
        {
            if(eachcon.AccountId != null)
            {
                AllId.add(eachcon.AccountId);
            }
        }
    }
    
    list<account>allAcc = [select id, Related_contact_count__c, (select id from Contacts)from account WHERE ID IN : AllId];
    for(account eachAC : allAcc)
    {
        list<contact>Allcon = eachAC.contacts;
        eachAC.Related_contact_count__c = Allcon.size();
    }
    if(!allAcc.isempty())
    {
        update allAcc;
    }
}