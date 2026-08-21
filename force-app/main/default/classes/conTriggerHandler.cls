public class conTriggerHandler 
{
    public static void handlerMethod(list<contact>newCon)
    {
        set<string>mails = new set<string>{};
        set<Id>accountIds = new set<Id>{};
        for(contact con : newCon)
        {
            if(con.email != null && con.accountId != null)
            {
                mails.add(con.email);
                accountIds.add(con.accountId);
            }
        }    
            set<string>existingCon = new set<string>{};
            for(contact con : [SELECT Email, AccountId FROM Contact WHERE Email IN : mails AND AccountId IN : accountIds])
            {
                string existingmail = con.AccountId+'-'+con.email;
                existingCon.add(existingmail);
            }    
        set<string>seenmail = new set<string>{};
        for(contact con : newCon)
        {
            if(con.AccountId!= null && con.Email != null)
            {
                string mail = con.AccountId+'-'+con.Email;
                if(existingCon.contains(mail) || seenmail.contains(mail))
                {
                    con.addError('Email already exists under same account');
                }
                else{
                    seenmail.add(mail);
                }
            }
        }
    }
}