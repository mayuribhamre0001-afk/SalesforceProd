public class scheduleExample implements schedulable
{
	public void Execute(system.schedulableContext SC)
    {
        list<account>allAc = [SELECT Id, Active__c, lastmodifiedDate FROM Account WHERE lastmodifiedDate < LAST_N_DAYS:30];
        for(account a : allAc)
        {
            if(a.Active__c != 'No')
            {
                a.Active__c = 'No';
            }
        }
        update allAc;
    }
}