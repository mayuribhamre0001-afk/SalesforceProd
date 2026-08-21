public class LeapYearFinder 
{
	public void method(integer year)
        
    {
        if((year/4)*4 == year)
        {
			system.debug(year+ ' is a leap year');            
        }
        else
        {
            system.debug(year+' is not a leap year');
        }
    }
}