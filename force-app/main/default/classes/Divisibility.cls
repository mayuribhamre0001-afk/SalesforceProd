public class Divisibility 
{
    public string method(integer a)
    {
		if((a/5)*5==a && (a/11)*11==a)
        {
            return 'Divisible';
        }
        else
        {
            return 'Not Divisible';
        }
    }

}