public class batchex implements database.batchable<sObject> 
{
	public database.queryLocator Start(database.batchableContext BAC)
    {
        return database.getQueryLocator('SELECT Id, Description, account.type FROM Contact');
    }
    public void Execute(database.batchableContext BAC, list<contact>scope)
    {
        list<contact>conToUpdate = new list<contact>{};
        for(contact c : scope)
            {
                if(c.accountId != null && c.account.type != null)
                {
                    if(c.description != c.account.type)
                    {
                        c.description = c.account.type;
                        conToUpdate.add(c);
                    }
                }
            }
        Update conToUpdate;
    }
    public void Finish(database.batchableContext BAC)
    {
        system.debug('Job Done');
    }
}