public class oldleads implements Database.batchable<SObject>
{
	public database.querylocator Start(Database.BatchableContext BAC)
    {
        Date cutoffDate = Date.today().addYears(-1);
        return Database.getQueryLocator([
            SELECT Id, FirstName, LastName, CreatedDate, IsConverted 
            FROM Lead 
            WHERE CreatedDate < :cutoffDate 
            AND IsConverted = FALSE
        ]);
    }
    public void Execute(database.batchableContext BAC, list<lead>scope)
    {
        if (!scope.isEmpty()) 
        {
            delete scope;
        }   
    }
    public void finish(database.batchableContext BAC)
    {
		System.debug('Old Leads Batch completed successfully at ' + Datetime.now());
    }
}