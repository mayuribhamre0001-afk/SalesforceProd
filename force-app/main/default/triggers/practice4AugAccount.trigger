trigger practice4AugAccount on Account (before delete) 
{
    set<Id>acId = new set<Id>{};
    for(account ac : trigger.old)
    {
        acId.add(ac.Id);
    }
    map<Id, Integer>acMap = new map<Id, Integer>{};
    for(aggregateResult ar : [SELECT AccountId acid, COUNT(Id)cnt FROM Opportunity WHERE AccountId IN : acId GROUP BY AccountId HAVING COUNT(Id)>0])
    {
        acMap.put((Id)ar.get('acid'), (integer)ar.get('cnt'));
    }
    for(account ac : trigger.old)
    {
        if(acMap.containskey(ac.Id))
        {
            ac.addError('Account with Opportunities cannot be deleted');
        }
    }
}