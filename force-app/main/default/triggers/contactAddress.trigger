trigger contactAddress on Contact (before insert) 
{
    set<id>allId = New set<id>{};
    for(contact Eachcon : trigger.new)
    {
        if(eachcon.AccountId!= null)
        {
            allId.add(eachcon.AccountId);
        }
    }
    
    map<id, account>AllAcc = new map<id, account>(
        [Select id, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, (select id from Contacts)from account where ID IN : allId]
    );
    
   for(contact Eachcon : Trigger.new)
   {
       account eachAc = AllAcc.get(eachcon.AccountId);
       
       if(eachcon.AccountId== eachAc.Id)
       {
           eachcon.MailingStreet = eachac.BillingStreet;
           eachcon.MailingCity = eachAc.BillingCity;
           eachcon.MailingState = eachac.BillingState;
           eachcon.MailingPostalCode = eachac.BillingPostalCode;
           eachcon.MailingCountry = eachac.BillingCountry;
       }
   }
}