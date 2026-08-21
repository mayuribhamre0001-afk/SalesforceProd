public class practice13dec implements database.batchable<Sobject>
{
	public database.queryLocator Start(database.batchableContext BAC)
    {
        return database.getquerylocator('select id, stagename from opportunity');
    }
    public void execute(database.batchablecontext BAC, list<opportunity>scope)
    {
        for(opportunity eachOp : scope)
        {
            eachOp.stagename = 'Prospecting';
        }
        update scope;
    }
    public void finish(database.batchablecontext BAC)
    {
        system.debug('Batch job successful');
    }
}