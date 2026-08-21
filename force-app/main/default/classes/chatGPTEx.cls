public class chatGPTEx 
{
	public integer DiscountCal(Integer Amount)
    {
        if(Amount>100000)
        {
            Integer Discount = Amount*10/100;
            return Discount+Amount;
        }
        else
        {
			Integer Discount = Amount*5/100;
            return Discount+Amount;
        }
    }
    
    Public string Attendance(decimal TotalClass, decimal Attended)
    {
		if(TotalClass== null || Attended == null || TotalClass<=0)
        {
			return 'Invalid Input';
        }
        Decimal Percentage = (Attended/TotalClass)*100;
        system.debug(Percentage);
        if(Percentage>=75)
        {
            Return 'Eligible';
        }
        Else
        {
			Return 'Not Eligible (Short Attendance)';
        }
    }
    
    Public String EvenOdd(Integer a)
    {
        if((a/2)*2==a)
        {
            Return a+' = Even No.';
        }
        else
        {
            Return a+ ' =Odd No.';
        }
    }
}