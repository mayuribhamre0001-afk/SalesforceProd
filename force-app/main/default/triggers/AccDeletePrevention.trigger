trigger AccDeletePrevention on Account (before delete) 
{
    set<id>acIds = new set<id>{};
	for(account ac : trigger.old)
    {
        acIds.add(ac.Id);
    }
    map<id, integer>AccOp = new map<id, integer>{};
    for(aggregateResult ar : [
        SELECT AccountId acId, count(Id)total FROM Opportunity WHERE AccountId IN : acIds GROUP BY AccountId HAVING COUNT(Id)>=1
    ])
    {
        AccOp.put((Id)ar.get('acId'), (integer)ar.get('total'));
    }
    for(account ac : trigger.old)
    {
        if(AccOp.containsKey(ac.id))
        {
            ac.adderror('Account with Opportunities cannot be deleted');
        }
    }
}