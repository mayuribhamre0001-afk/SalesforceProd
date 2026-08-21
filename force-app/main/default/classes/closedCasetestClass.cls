@isTest
public class closedCasetestClass 
{	
	@isTest
    public static void method()
    {
        case C = new case();
        C.Status = 'New';
        C.Origin = 'Call';
        c.Subject = 'Test case';
        
        insert c;
        
        c.Status = 'Closed';
        test.startTest();
        update C;
        test.stopTest();
        
        case D = [select Is_Closed__c from case where id =: C.Id];
        
        system.assertequals(true, D.Is_Closed__c);
    }
}