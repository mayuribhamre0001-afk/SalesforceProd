public class Grade 
{
	public string method(integer StudentPercentage)
    {
        if(StudentPercentage== Null)
        {
            return 'invalid input';
        }
        else if(StudentPercentage>=90)
        {
			return 'A';
        }
        else if(StudentPercentage>=80)
        {
            return 'B';			
        }
        else if(StudentPercentage>=70)
        {
			return 'C';
        }
        else if(StudentPercentage>=60)        
        {
            return 'D';			
        }
        else
        {
            return 'Fail';			
        }
    }
}