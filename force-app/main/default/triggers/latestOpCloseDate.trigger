trigger latestOpCloseDate on Opportunity (after insert, after update) 
{
    set<id>allAcc = new set<id>{};
    for(opportunity Opp : trigger.new)
    {
        if(Opp.accountId != null)
        {
            allAcc.add(Opp.accountId);
        }
    }
    map<id, account> accountMap = new map<id, account>(
    [SELECT Id, Latest_Opportunity_Close_Date__c FROM Account WHERE Id IN : allAcc]
    );
    
    for(opportunity Op : trigger.new)
    {
        if(Op.accountId != null && accountMap.containskey(Op.AccountId))
        {
            account Acc = accountMap.get(Op.AccountId);
            if(Acc.Latest_Opportunity_Close_Date__c == null || Op.CloseDate > Acc.Latest_Opportunity_Close_Date__c)
            {
                Acc.Latest_Opportunity_Close_Date__c = Op.CloseDate;
            }
        }
    }
    update accountMap.values();
}