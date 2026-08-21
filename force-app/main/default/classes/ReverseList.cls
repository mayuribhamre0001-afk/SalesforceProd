public class ReverseList
{
	public void method()
    {
        list<integer> originalList = new list<integer>{10,30,40,60,70,20,40,100};
        system.debug(originalList);
        list<integer> Newlist = new list<integer>{};
        for (Integer i = originalList.size() - 1; i >= 0; i--)
        {
            NewList.add(originalList[i]);
        }
        system.debug(Newlist);

    }

}