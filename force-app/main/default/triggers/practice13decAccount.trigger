trigger practice13decAccount on Account (before insert) 
{
    set<string>AllId = new set<string>{};
    for(account eachAc : trigger.new)
    {
        if(eachAc.name != null)
        {
            AllId.add(eachAc.name);
        }
    }
    map<string, account>AllAc = new map<string, account>(
    [select id, name from account where name IN : AllId]
    );
    for(account eachac : trigger.new)
    {
        if(AllAc.containskey(eachac.Name))
        {
            eachac.adderror('This name already exists');
        }
    }
}