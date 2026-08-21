public class evenoddClass 
{
    integer a = 89;
    integer b = 2;
    public void method()
    {
        if(math.mod(a,b)==0)
        {
            system.debug('a is an even no');
        }
        else if(math.mod(a,b)!=0)
        {
            system.debug('a is odd no');
        }
        else
        {
            system.debug('invalid input');
        }
    }

}