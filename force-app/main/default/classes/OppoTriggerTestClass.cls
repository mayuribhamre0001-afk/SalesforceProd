@isTest
public class OppoTriggerTestClass 
{
    @isTest
    static void testOpClosedate() 
    {
        account ac = new account();
        ac.name = 'demo acc';
        ac.Phone = '7788667788';
        
        insert ac;
        account newac = [select id from Account where name = 'demo acc'];
        
        opportunity op = new opportunity();
        op.name = 'demo Op';
        op.StageName = 'Qualification';
        op.AccountId = newac.Id;
        op.closedate = date.today().addDays(20);
        
        insert op;
        
        op.StageName = 'closed Won';
        
        test.startTest();
            update op;
        test.stopTest();
        
        account acc2 = [select id, Latest_Opportunity_Close_Date__c from Account where id=: newac.Id];
        system.assertEquals(date.today(), acc2.Latest_Opportunity_Close_Date__c);
        system.debug(acc2.Latest_Opportunity_Close_Date__c);
            
    }   
}