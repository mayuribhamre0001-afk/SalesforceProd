trigger oppLastAmt on Opportunity (after update) 
{
    set<id>allId = new set<Id>{};
       
    for(opportunity eachOp : trigger.New)
    {
        Opportunity oldOp = trigger.oldmap.get(eachOp.id);
        if(eachOp.AccountId!= null && eachOp.StageName != oldOp.StageName && eachOp.StageName == 'Closed Won')
        {
            allId.add(eachop.AccountId);
        }
    }
    list<account>AllAcc = [SELECT Id, Last_Closed_Opportunity_Amount__c FROM Account WHERE Id IN : allId];
}