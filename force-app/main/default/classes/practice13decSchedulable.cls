public class practice13decSchedulable implements schedulable 
{
	public void execute(system.schedulableContext SC)
    {
        database.executebatch(new practice13dec(), 20);
    }    
}