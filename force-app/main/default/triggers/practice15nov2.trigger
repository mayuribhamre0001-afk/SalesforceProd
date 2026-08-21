trigger practice15nov2 on Contact (after insert, after update, after delete, after undelete) 
{
    set<id>AccToUpdate = new set<id>{};
    if(trigger.isinsert || trigger.isundelete)
    {
        for(contact eachCon : Trigger.new)
        {
            if(eachcon.accountid != null)
            AccToUpdate.add(eachcon.AccountId);    
        }
    }
    
    if(trigger.isupdate)
    {
        for(contact C : Trigger.new)
        {
            contact oldC = Trigger.oldmap.get(C.id);
            if(C.accountid != oldC.AccountId)
            {
                if(C.accountid != null)
                {
                    AccToUpdate.add(C.accountid);   
                }
                if(oldC.AccountId != null)
                {
                    AccToUpdate.add(oldC.AccountId);
                }
            }
        }
    }
    
    if(trigger.isdelete)
    {
        for(contact EachC : Trigger.old)
        {
            if(EachC.Accountid != null)
            {
                AccToUpdate.add(eachC.AccountId);
            }
        }
    }
    list<account>NewAcclist = new list<account>{};
    list<account>Newacc = [select id, name, Related_contact_count__c, (select id from Contacts) from account where id IN : AccToUpdate];
    for(account eachac : Newacc)
    {
        list<contact>ConC = eachac.contacts;
        eachac.Related_contact_count__c = ConC.size();
        NewAcclist.add(eachac);
    }
    update NewAcclist;
}