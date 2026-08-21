@isTest
public class VIPContactTestClass 
{
	@isTest
    public static void testCEOSalutation()
    {
        contact c = new contact();
        c.salutation = 'CEO';
        c.FirstName = 'Demo';
        c.LastName = 'Contact';
		
        test.startTest();
        Insert c;
        test.stopTest();
        
        contact newC = [SELECT Is_VIP__c FROM Contact WHERE Id =: c.Id];
        system.assertEquals(true,newC.Is_VIP__c);
        system.debug(newC.Is_VIP__c);
    }
    @isTest
    Public static void testNonCEO()
    {
        contact a = new contact();
        a.Salutation = 'Mr.';
        a.firstName = 'second';
        a.LastName = 'contact';
        
        test.startTest();
        Insert a;
        test.stopTest();
        
        contact newA = [SELECT Is_VIP__c FROM Contact WHERE Id =: a.Id];
        system.assertEquals(false, newA.Is_VIP__c);
        system.debug(newA.Is_VIP__c);
    }
}