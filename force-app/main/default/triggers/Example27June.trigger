trigger Example27June on Account (after insert, after update) 
{
    list<account> allacc = trigger.new;
    list<account> alloldacc = trigger.old;
    
    if(trigger.isinsert && trigger.isafter)
    {list<contact> contactstoupdate = new list<contact>{};
    
    for(account eachacc : allacc)
    {
        if(eachacc.Active__c== 'yes')
        {
            contact c = new contact();
            c.lastname = eachacc.Name;
            c.Description = eachacc.Description;
            c.fax = eachacc.fax;
            c.phone = eachacc.phone;
            c.MailingCity = eachacc.BillingCity;
            c.MailingState = eachacc.BillingState;
            c.MailingCountry = eachacc.BillingCountry;
            c.AccountId = eachacc.Id;
          
            contactstoupdate.add(c);
        }
    }
    insert contactstoupdate;
    }
    
    else if(trigger.isupdate && trigger.isafter)
    {
        list<contact> updatedcon = new list<contact>{};

        for(account eachnewacc : allacc)
        {
            for(account eacholdacc : alloldacc)
            {
                if(eachnewacc.id == eacholdacc.id)
                {
                    if(eacholdacc.Active__c != 'yes' && eachnewacc.Active__c == 'yes')
                    {
                        contact c = new contact();
                        c.lastname = eachnewacc.Name;
                        c.Description = eachnewacc.Description;
                        c.fax = eachnewacc.fax;
                        c.phone = eachnewacc.phone;
                        c.MailingCity = eachnewacc.BillingCity;
                        c.MailingState = eachnewacc.BillingState;
                        c.MailingCountry = eachnewacc.BillingCountry;
                        c.AccountId = eachnewacc.Id;
                        
                        updatedcon.add(c);
                               
                    }

                }
            }
        }
        insert updatedcon;
    }

}