trigger practice24Nov on Opportunity (after insert, after update, after delete, after undelete) 
{
    set<id>AllId = new set<id>{};
    if(trigger.isinsert || trigger.isundelete)
    {
        for(opportunity eachOp : Trigger.new)
        {
            if(eachOp.AccountId != null)
            {
                AllId.add(eachOp.AccountId);
            }
        }
    }
    if(trigger.isupdate)
    {
        for(opportunity EachOpp : Trigger.new)
        {
            Opportunity Oldop = trigger.oldmap.get(EachOpp.Id);
            if(EachOpp.AccountId!= null)
            {
                AllId.add(eachOpp.AccountId);
            }
            if(Oldop.AccountId!= null)
            {
                AllId.add(Oldop.AccountId);
            }
        }
    }
    if(Trigger.isDelete)
    {
        for(Opportunity Op: Trigger.old)
        {
            if(Op.accountId != null)
            {
                AllId.add(Op.accountId);
            }
        }
    }
    list<account>AcctoUpdate = new list<account>{};
    list<Account>AllAcc = [SELECT id, name, AnnualRevenue,(select id, amount from opportunities) from account where id IN :AllId];
    for(account EachAc : AllAcc)
    {
        list<opportunity>AllOpp = EachAc.Opportunities;
        decimal sum = 0;
        for(opportunity Opp : Allopp)
        {
            sum+= Opp.amount;
        }
        EachAc.AnnualRevenue = sum;
        EachAc.Related_Opportunity_Count__c = Allopp.size();
        AcctoUpdate.add(Eachac);
    }
    if (!AcctoUpdate.isEmpty()) 
    {
        update AcctoUpdate;   
    }    
}