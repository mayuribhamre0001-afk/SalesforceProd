@istest
public class practice9DecTest 
{
	@istest
    public static void method()
    {
        account a = new account();
        a.Name = 'Test account';
        a.Active__c = 'Yes';
        a.Phone = '8080801122';

        account b = new account();
        b.name = 'Test account 2';
        b.Active__c = 'Yes';
        b.Phone = '7766554433';
        
        insert new list<account>{a,b};
            
        contact C = new contact();
        c.LastName = 'test contact';
        c.Active__c = true;
        c.AccountId = a.Id;
        
        contact D = new contact();
        D.LastName = 'test contact 2';
        D.Active__c = true;
        D.AccountId = b.Id;
        
        insert new list<contact>{C,D};
        
        a.Active__c = 'No';
        b.Active__c = 'Yes';
        update new list<account>{a,b};
        
        C = [select id, Active__c, accountId from contact where Id = : C.id];
        D = [Select id, Active__c, accountId from contact where Id = : D.Id];
        
        system.assertEquals(false, C.Active__c,'Contact C should not be active');
        system.assertEquals(true, D.Active__c, 'Contact D should be active');
    }
}