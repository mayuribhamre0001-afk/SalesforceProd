public class OppHandlerClass 
{
    public static void oppMethod(list<opportunity>newList, map<id, opportunity>oldMap)
    {
        set<Id>accId = new set<Id>{};
        for(opportunity op : newList)
        {
            opportunity oldOp = oldMap.get(op.id);
            
            if(op.stagename == 'Closed Won' && oldOp.stagename != 'Closed Won' && op.accountId != null)
            {
                accId.add(op.accountId);
            }
        }
        list<account>newacc = new list<account>{};
        map<Id, Account>allAcc = new map<Id, Account>(
            [SELECT Id, Latest_Opportunity_Close_Date__c FROM Account WHERE Id IN : accId]
            );
        
        for(id acid : accId)
        {
            account ac2 = allAcc.get(acid);
            ac2.Latest_Opportunity_Close_Date__c = system.today();
            
            newacc.add(ac2);
        }
      if(!newacc.isEmpty())
      {
          update newacc;
      }
    }
}