public class batchPractice12April implements database.batchable<sObject>
{
	public database.queryLocator start(database.batchableContext BAC)
    {
        return database.getQueryLocator('SELECT Id, lastmodifiedDate, Active__c FROM Account WHERE lastModifiedDate > LAST_N_YEARS:1 ');
    }
    public void execute(database.batchableContext BAC, list<account>scope)
    {
        for(account a : scope)
        {
                a.active__c = 'No';
        }
        update scope;
    }
    public void finish(database.batchableContext BAC)
    {
        system.debug('job completed');
    }
}