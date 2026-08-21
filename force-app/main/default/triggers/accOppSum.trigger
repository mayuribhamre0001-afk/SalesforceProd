trigger accOppSum on Opportunity (after insert, after delete, after update, after undelete) 
{
     set<Id>AllId = new set<Id>{};
   if(trigger.isinsert || trigger.isundelete)
   { 
       for(opportunity eachop : trigger.new)
        {
            if(eachop.accountId != null)
            {
                AllId.add(eachop.accountId);
            }
        }
   }
    if(trigger.isupdate)
    {
        for(opportunity eachop : trigger.new)
        {
            opportunity oldop = trigger.oldmap.get(eachop.id);
            if(eachop.AccountId!=oldop.AccountId)
            {
                if(eachop.AccountId != null)
                {
                    AllId.add(eachop.AccountId);
                }
                if(oldop.AccountId != null)
                {
                    AllId.add(oldop.AccountId);  
                }
            }
        }
    }
    if(trigger.isdelete)
    {
        for(opportunity eachop : trigger.old)
        {
            if(eachop.AccountId != null)
            {
                AllId.add(eachop.AccountId);
            }
        }
    }
    list<account>acctoupdate = new list<account>{};
    
    list<account>allAcc = [select id, Related_Opportunity_Count__c, Related_Opportunity_sum__c, (select id from opportunities)from account WHERE ID IN : AllId];
    for(account eachAC : allAcc)
    {
        list<contact>Allcon = eachAC.contacts;
        eachAC.Related_contact_count__c = Allcon.size();
    }
    if(!allAcc.isempty())
    {
    update allAcc;
    }
    for(account eachac : allAcc)
    {
        list<opportunity>allop = eachac.opportunities;
        decimal sum = 0;
        for(opportunity eachop : allop)
        {
            sum += eachop.Amount;
        }
        eachac.Related_Opportunity_sum__c = sum;
        acctoupdate.add(eachac);
    }
    update acctoupdate;
}