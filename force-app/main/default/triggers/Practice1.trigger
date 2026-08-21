trigger Practice1 on Contact (before insert, before update) 
{
    list<contact> Allcon = Trigger.New;
    set <id> allaccId = new set<id>{};
        
    for(contact eachcon : Allcon)
    {
        if(eachcon.accountId != null)
        {
            allaccId.add(eachcon.accountid);
        }
    }
    map<id,account> MapAcc = new map<id,account>([select id, active__c from account where Id In: allaccId]);
    for(contact con : Allcon)
    {
        if(con.accountid != null)
        {
            Account Relatedacc = MapAcc.get(con.AccountId);
            If(Relatedacc.Active__c!='Yes')
            {
                con.adderror('cannot create account as account is INACTIVE');
            }
        }
        Else if(con.AccountId == null)
        {
            con.adderror('Related account not selected');
        }
    }
}