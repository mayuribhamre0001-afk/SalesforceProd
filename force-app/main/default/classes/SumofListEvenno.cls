public class SumofListEvenno 
{
    list<integer>Allno = new list<integer>{1,2,3,4,5,6,7,8,9,10,12};
        
    public void method()
    {
        integer sum = 0;
        for(integer eachno : Allno)
        {
            if((eachno/2)*2==eachno)
            {
                sum+=eachno;
            }
        }
        system.debug(sum);
    }
}