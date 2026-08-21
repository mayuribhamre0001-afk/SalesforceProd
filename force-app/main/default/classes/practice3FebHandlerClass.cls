public class practice3FebHandlerClass 
{
	public static void method(list<contact>allCon)
    {        
        set<id>allId = new set<id>{};
        for(contact eachCon : allcon)
        {
            if(eachcon.accountid != null)
            {
                allId.add(eachcon.accountId);
            }
        }
        map<id, account> allAcc = new map<id, Account>(
        [SELECT Id, Industry FROM Account WHERE Id IN : allId]
        );
        
        for(contact eachcon : allcon)
        {
            if(eachcon.accountid != null && allAcc.containskey(eachcon.AccountId))
            {
                eachcon.Account_Industry__c = allAcc.get(eachcon.AccountId).Industry;
            }
        }
    }
}