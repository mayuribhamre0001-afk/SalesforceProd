public class MergeList 
{
    set<integer> List1 = new set<integer>{11,2,10,3,55,6,7,10,4,28,8};
    set<integer> List2 = new set<integer>{10,20,87,66,20,8,5,3};
        
    public void method()
    {
		List1.addall(List2);
        system.debug(List1);
    }	    
}