public class OperatorsNIntegers 
{
	Public void Method(decimal a, decimal b, string operator)
    {
        if(operator == '+')
        {
            system.debug(a+b);
        }
        else if(operator == '-')
        {
            system.debug(a-b);
        }
        else if(operator == '*')
        {
			system.debug(a*b);
        }
        else if(operator == '/')
        {
			if(b == 0)
            {
                system.debug('division by zero is not allowed');
            }
            else
            {
                system.debug(a/b);
            }
        }
    }
}