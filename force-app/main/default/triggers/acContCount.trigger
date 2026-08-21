trigger acContCount on Contact (after insert, after update, after delete, after undelete) 
{
    set<Id>accountIds = new set<Id>{};
    if(trigger.isInsert || trigger.isUndelete || trigger.isUpdate)
    {
        for(contact con : trigger.new)
        {
            if(con.accountId != null)
            {
				accountIds.add(con.accountId);
            }
        }
    }
    if(trigger.isDelete || trigger.isUpdate)
    {
		for(contact con : trigger.old)
        {
            if(con.accountId != null)
            {
                accountIds.add(con.AccountId);
            }
        }
    }
    map<id, integer>existingAc = new map<id, integer>{};
    for(aggregateResult ar : [
        SELECT accountId ids, count(id)total FROM Contact WHERE AccountId IN : accountIds GROUP BY accountId
    ])
    {
        existingAc.put((id)ar.get('ids'), (integer)ar.get('total'));
    }
    list<account>newAc = new list<account>{};
    for(id eachId : accountIds)
    {
        newAc.add(new account(Id= eachId, Total_Con__c = existingAc.containsKey(eachId)
                ? existingAc.get(eachId)
                : 0));
    }
     update newAc;  
}