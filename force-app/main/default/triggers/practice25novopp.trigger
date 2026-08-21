trigger practice25novopp on Opportunity (after insert) 
{
    set<id>AllId = new set<id>{};
    for(opportunity Op : Trigger.new)
    {
        if(op.accountid != null)
        {
            AllId.add(op.accountid);
        }
    }
    map<id, account>AllAcc = new map<id, account>(
    [SELECT id, type from account where id IN : AllId]
    );
	for(opportunity eachop : trigger.new)
    {
        if(eachop.accountid != null && AllAcc.containskey(eachop.AccountId) && AllAcc.get(eachop.AccountId).type == 'Prospect')
        {
            eachop.adderror('You cannot create Opportunity for the Account type Prospect');
        }
    }
}