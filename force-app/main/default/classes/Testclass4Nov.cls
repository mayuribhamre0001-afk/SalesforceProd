@isTest
public class Testclass4Nov 
{
	@isTest
    static void method()
    {
		contact C = new contact();
        C.FirstName = 'ROHIT';
        C.LastName = 'SHARMA';
    
        INSERT C;
        
        System.AssertNotEquals(null, C.Id, 'CONTACT INSERTED SUCCESSFULLY');
    }
    
}