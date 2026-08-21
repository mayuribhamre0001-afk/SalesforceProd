public class squaremethod 
{
    public static void method(integer N)
    {
        if(N==null || N<=0)
        {
            system.debug('please provide a positive no.');
        }
        else
        {
            for(integer i = 1; i<=N; i++)
            {
                integer square = i*i;
                system.debug('number :' +i+ ' | square = '+square);

            }
        }
    }

}