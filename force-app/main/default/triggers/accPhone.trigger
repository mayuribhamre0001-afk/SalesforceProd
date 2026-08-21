trigger accPhone on Contact (before insert) 
{
    set<Id>acIds = new set<Id>{};
	for(contact con : trigger.new)
    {
        if(con.accountId != null)
        {
            acIds.add(con.accountId);
        }
    }
    map<Id, string>accPhone = new map<id, string>{};
    for(account ac : [SELECT Id, phone FROM Account WHERE Id IN : acIds])
    {
        accPhone.put(ac.Id, ac.phone);
    }
}