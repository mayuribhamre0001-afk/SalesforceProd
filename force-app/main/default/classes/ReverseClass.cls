public class ReverseClass 
{
    public void method()
    {
        list<integer> OGList = New list<integer>{1,2,5,7,10,12};
            system.debug(OGList);
        List<integer> Newlist = New list<integer>{};
            
            for(integer i = OGList.size()-1; i>=0; i--)
        {
            Newlist.add(OGList[i]);
        }
			system.debug(Newlist);
    }

}