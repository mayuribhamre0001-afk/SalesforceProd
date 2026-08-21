public class MinMax2 
{
    
    public void method(list<integer> Allno)
    
    {
        integer min= Allno[0];
	    integer max= Allno[0];
        for(integer eachno: Allno)
		{
    	if(eachno< min)
    	{
        	min = eachno;
    	}
    	if(eachno>max)
    	{
        	max = eachno;
    	}
		}
        system.debug(Allno);
        system.debug(min);
    	system.debug(max);
    }
    }