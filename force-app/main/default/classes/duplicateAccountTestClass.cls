@isTest
public class duplicateAccountTestClass 
{
	@isTest
    public static void method()
    {
        account ac = new account();
        ac.Name = 'Demo';
        ac.Phone = '1234567891';
        
        Insert ac;
        test.startTest();
        boolean exceptionThrown = false;
        try
        {
            account ab = new account();
            ab.Name = 'Demo';
            ab.Phone = '4545454545';
        	Insert ab;    
        }
        catch(DMLexception e)
        {
            exceptionThrown = true;
            system.debug(e.getmessage());
        }
        test.stopTest();
        
        system.assert(exceptionThrown, 'Duplicate exception should have been thrown');
    }
}