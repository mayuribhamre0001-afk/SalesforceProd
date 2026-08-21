public class practice11dec implements schedulable
{
	public void execute(system.schedulableContext sc)
    {
    	Log__c record = new Log__c();
        record.Name = 'Scheduler ran successfully';
        
        insert record;
    }
}