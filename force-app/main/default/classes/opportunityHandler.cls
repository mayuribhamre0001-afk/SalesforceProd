public class opportunityHandler 
{
	public static void method(list<opportunity>AllOp)
    {
        for(opportunity EachOp : AllOp)
    {
        if(EachOp.stagename == 'Closed Won')
        {
            EachOp.adderror('Opportunity in Closed Won stage cannot be deleted');
        }
    }
    }
}