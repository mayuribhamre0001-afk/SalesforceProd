@isTest
private class TestClass1 
{
    @isTest
	Private static void case1()
    {
        contact c = new contact();
        c.FirstName = 'dummy';
        c.LastName = 'data';
        c.Email = 'dummydata@gmail.com';
        c.MailingCity = 'Pune';
        
        insert c;
        
        contact D = [select id, email from contact where Id =:c.Id];
            
        system.assertequals('no@gmail.com', D.email);
    }
}