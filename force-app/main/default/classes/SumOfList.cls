public class SumOfList 
{
    list<integer> Allno = new list<integer>{10,2,3,4,5};
        
    public integer method()
    {
        integer sum = 0;

        for(integer eachno : Allno)
        {
       		sum+= eachno;
	    }
       	    return sum;

    }

}