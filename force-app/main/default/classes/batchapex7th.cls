public class batchapex7th implements database.batchable<sobject>
{
	public database.querylocator Start(database.batchableContext BAC)
    {
        return database.getquerylocator([select name, id, (select name, id, amount from opportunities)from account]);
    }
    public void execute(database.batchableContext BAC, list<account>AllAc)
    {
        for(account eachAc : AllAc)
        {
            if(eachAc.Related_Opportunity_sum__c> 100000)
            {
                eachAc.Description = 'Hot';
            }
            else if(eachAc.Related_Opportunity_sum__c> 50000)
            {
                eachAc.Description = 'Warm';
            }
            else
            {
                eachAc.Description = 'Cold';
            }
        }
    }
    public void finish(Database.BatchableContext BAC)
    {
        system.debug('The batch method executed successfully');
    }
}