trigger aug17account on Account (after insert) 
{
    list<contact>conList = new list<contact>{};
	for(account ac : trigger.new)
    {
        contact c = new contact();
        c.AccountId = ac.Id;
        c.LastName = ac.Name;
        
        conList.add(c);
    }
    Insert conList;
}