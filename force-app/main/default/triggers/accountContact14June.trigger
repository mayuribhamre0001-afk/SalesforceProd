trigger accountContact14June on Account (after insert) 
{
    list<contact>conList = new list<contact>{};
	for(account ac : trigger.new)
    {
        conlist.add(new contact(lastName = 'Primary Contact', email = ac.name+'@example.com', accountId = ac.Id));
    }
    insert conList;
}