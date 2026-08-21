trigger oppoStageName on Opportunity (after update)
{
    set<Id>acId = new set<Id>{};
    for(opportunity op : trigger.new)
    {
        opportunity oldOp = trigger.oldmap.get(op.id);
        if(op.StageName == 'Closed Won' && oldOp.StageName != 'Closed Won')
        {
            acId.add(op.AccountId);
        }
    }
    list<account>allAc = [SELECT Id, Customer_Status__c FROM Account WHERE Id IN : acId];
    for(account ac : allAc)
    {
        ac.Customer_Status__c = 'Active';
    }
    if(!allAc.isEmpty())
    {
        update allAc;
    }
}