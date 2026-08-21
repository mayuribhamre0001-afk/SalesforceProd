@isTest
public class contactTriggerTestClass 
{
	@isTest
    public static void testMethod1()
    {
        account a = new account();
        a.Name = 'dummy account';
        a.Phone ='4545454545';
        Insert a;
        
        contact c = new contact();
        c.LastName = 'dummy';
        c.Email = 'mayuri01@gmail.com';
        c.AccountId = a.Id;
        Insert c;
                
        contact d = new contact();
        d.LastName = 'dummy con';
        d.AccountId = a.Id;
        d.Email = 'mayuri01@gmail.com';
        
        test.startTest();
        try{
            Insert d;
            system.assert(false);
        }
        catch(dmlException E)
        {
            system.assert(e.getmessage().contains('Email already exists'), 'validation rule mismatch');
            system.debug(e.getmessage());
        }
        test.stopTest();
    }
}