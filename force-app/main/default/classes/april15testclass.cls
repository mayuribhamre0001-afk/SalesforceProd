@isTest
public class april15testclass 
{
	@isTest
    public static void method()
    {
        contact c = new contact();
        c.FirstName = 'Demo';
        c.LastName = 'con';
        c.Email = 'demo@gmail.com';
         
        Insert c;
        
        contact b = new contact();
        b.FirstName = 'demo';
        b.LastName = 'lead2';
        b.Email = 'demo@gmail.com';
        
        test.startTest();
        try
        {
            insert b;
            system.assert(false, 'validation rule failes');
        }
        catch(dmlException e)
        {
            system.assert(e.getmessage().contains('nana'), 'validation message mismatch');
            system.debug(e.getmessage());
        }
        test.stopTest();
    }
}