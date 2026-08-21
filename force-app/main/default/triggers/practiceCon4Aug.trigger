trigger practiceCon4Aug on Contact (before insert, before update) 
{
    set<Id>acId = new set<Id>{};
    if(trigger.isInsert)
    {
        for(contact con : trigger.new)
        {
            if(con.accountId != null)
            {
                acId.add(con.accountId);
            }
        }
    }
    if(trigger.isUpdate)
    {
        for(contact con : trigger.new)
        {
            contact oldcon = trigger.oldmap.get(con.Id);
            if(con.AccountId != oldcon.AccountId)
            {
                if(oldcon.AccountId!= null)
                {
                    acId.add(oldcon.AccountId);
                }
                if(con.AccountId != null)
                {
                    acId.add(con.AccountId);
                }
            }
        }
    }
    map<Id, Integer>AcCount = new map<Id, Integer>{};
    for(aggregateResult ar : [SELECT AccountId acId, COUNT(Id)cnt FROM Contact WHERE accountId IN : acId GROUP BY AccountId HAVING COUNT(Id)=5])
    {
        acCount.put((Id)ar.get('acId'), (Integer)ar.get('cnt'));
    }
    for(contact con : trigger.new)
    {
        if(AcCount.containskey(con.AccountId))
        {
            con.adderror('An Account cannot have more than 5 contacts');
        }
    }
}