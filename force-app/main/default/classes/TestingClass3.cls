@isTest
Private class TestingClass3 
{
	@isTest
    Private Static void case1()
    {
        contact c = new contact();
        c.FirstName = 'dummy';
        c.LastName = 'lead';
        c.MailingCity = 'Pune';
        c.Email = 'dummy@gmail.com';
        
        insert c;
        
        c.LastName = 'lead2';
        update c;
    }
    
    @isTest
    Private static void case2()
    {
        contact c = new contact();
        c.FirstName = 'dummy';
        c.LastName = 'lead';
        c.MailingCity = 'mumbai';
        c.Email = 'dummy@gmail.com';
        
        insert c;
        
        c.MailingCity = 'Pune';
        update c;
    }
}