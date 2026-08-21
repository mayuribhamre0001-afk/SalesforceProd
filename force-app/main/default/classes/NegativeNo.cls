public class NegativeNo 
{        
    List<integer> Positiveno = new List<Integer>{};
	
    Public void Method(List<integer> inputlist)
    {
     	for(integer Eachno : inputlist)
        {
            if(Eachno>=0)
            {
                Positiveno.add(Eachno);
            }
        }
        system.debug(Positiveno);
    }
}