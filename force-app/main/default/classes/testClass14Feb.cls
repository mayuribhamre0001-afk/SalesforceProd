@isTest
public class testClass14Feb 
{
	@isTest
    public static void method()
    {
		account Acc = new account();
        Acc.Name = 'Demo Account';
        Acc.Phone = '8943567833';
        
        insert Acc;
        
        opportunity op = new opportunity();
        op.Name = 'demo opportunity';
        op.CloseDate = date.today();
        op.StageName = 'Prospective';
        op.AccountId = Acc.Id;
        
        opportunity op2 = new opportunity();
        op2.Name = 'demo opportunity 2';
        op2.CloseDate = date.today().addDays(30);
        op2.StageName = 'Prospective';
        op2.AccountId = Acc.Id;
        
        opportunity op3 = new opportunity();
        op3.Name = 'demo opportunity 3';
        op3.CloseDate = date.today().addDays(15);
        op3.StageName = 'Prospective';
        op3.AccountId = Acc.Id;
        
        list<opportunity>AllOp = new list<opportunity>{op, op2, op3};
            
        test.startTest();
        insert Allop;
        test.stopTest();
        
        account updateAcc = [SELECT Latest_Opportunity_Close_Date__c from account WHERE Id =: Acc.Id];
        
        date matchdate = date.today().addDays(30);
        system.assertEquals(matchdate, updateAcc.Latest_Opportunity_Close_Date__c);
        system.debug(updateAcc.Latest_Opportunity_Close_Date__c);
    }
}