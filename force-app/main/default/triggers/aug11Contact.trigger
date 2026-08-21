trigger aug11Contact on Contact (before insert) 
{
    set<Id>acId = new set<Id>{};
	for(contact con : trigger.new)
    {
        if(con.accountId != null)
        {
            acId.add(con.accountId);
        }
    }
    map<Id, string>AcMap = new map<Id, string>{};
    for(contact c : [SELECT AccountId, Email FROM Contact WHERE accountId IN : acId])
    {
        AcMap.put(c.AccountId, c.Email);
    }
    for(contact con : trigger.new)
    {
        if(AcMap.containsKey(con.AccountId) && con.Email == AcMap.get(con.AccountId))
        {
            
        }
    }
}