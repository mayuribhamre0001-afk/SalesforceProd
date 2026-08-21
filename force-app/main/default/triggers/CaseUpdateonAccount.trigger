trigger CaseUpdateonAccount on Case (after insert, after update, after delete, after undelete) 
{
    set<id>allId = new set<id>{};
    if(trigger.isinsert || trigger.isundelete)
    {
        for(case eachcase : trigger.new)
        {
            if(eachcase.accountid != null)
            {
                allId.add(eachcase.AccountId);
            }
        }
    }
    
    if(trigger.isupdate)
    {
        for(case eachcase : trigger.new)
        {
            case oldcase = trigger.oldmap.get(eachcase.Id);
            if(eachcase.AccountId != oldcase.AccountId || eachcase.IsClosed != oldcase.IsClosed)
            {
                if(eachcase.AccountId != null)
                {
                    allId.add(eachcase.AccountId);
                }
                if(oldcase.AccountId != null)
                {
                    allId.add(oldcase.AccountId);
                }
            }
        }
    }
    
    if(trigger.isdelete)
    {
        for(case eachcase : trigger.old)
        {
            if(eachcase.AccountId != null)
            {
                allId.add(eachcase.AccountId);
            }
        }
    }
    
    list<case>Allcase = [select id, accountid from case where isclosed = false and accountId IN : allId];
    map<id, integer>casecount = new map<id, integer>{};
    for(case C : Allcase)
    {
        if(!casecount.containskey(C.accountid))
        {
            casecount.put(C.accountid , 1);
        }
        else
        {
            casecount.put(C.accountid, casecount.get(c.accountid)+1);
        }
    }

}