public class TestClass2 
{
    static boolean flag = True;
	public static void handlermethod(list<opportunity>Allop)
    {
        if(flag == true)
        {
            flag = false;
            list <opportunity> Newop = new list<opportunity>{};
        	for(opportunity eachop : AllOp)
            {
                if(eachop.Amount>=100000)
                {
                    opportunity a = new opportunity();
                    a.Name = eachop.Name+' Duplicate';
                    a.Amount = eachop.Amount;
                    a.StageName = eachop.StageName;
                    a.Description = eachop.Description;
                    a.CloseDate = eachop.CloseDate;
                    a.Probability = eachop.Probability;
                    
                    Newop.add(a);
                }
            }
            insert Newop;
        }
    }
}