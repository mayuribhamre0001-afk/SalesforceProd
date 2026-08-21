@isTest
public class accountIndustryTest 
{
	@isTest
    public static void method()
    {        
        account a = new account();
        a.name = 'test data';
        
        test.startTest();
        try
        {
            insert a;
            system.assert(false, 'validation should fail on insert');
        }
        catch(dmlException e)
        {
            system.assert(e.getmessage().contains('empty'),'validation message mismatch');
            system.debug(e.getmessage());
        }
        test.stopTest();
    }
	static void contactTest()
    {
        account a = new account();
        a.Name = 'test';
        a.phone = '5656565665';
        
        test.startTest();
        Insert a;
        test.stopTest();
        
        list<contact>con = [SELECT Id, LastName, accountId FROM Contact WHERE AccountId =: a.Id];
        
        system.assertequals(1, con.size(), 'contact not inserted');
        system.assertequals('test', con[0].lastName, 'contact not inserted');
    }
}