trigger Practice2 on Account (after update) 
{
    list<account> allaccnew = Trigger.new;
    map<id, account> oldaccmap = trigger.oldmap;
    set<id> AllId = new set<id>{};
    for(account eachacc : allaccnew)
    {
        id eachaccId = eachacc.Id;
        account eacholdacc = oldaccmap.get(eachacc.id);
        if(eachacc.Type != eacholdacc.Type)
        {
            AllId.add(eachaccId);
        }
        list<opportunity> AllOp = [select name, id, description, account.type from opportunity where accountId IN :AllId];
        list<opportunity> OpToUpdate = new list<opportunity>{};
        for(opportunity eachOp : AllOP)
        {
            eachOp.description = 'Account Type = '+eachop.account.type;
            OpToUpdate.add(eachop);
        }
          
        update OpToUpdate;
    }
}