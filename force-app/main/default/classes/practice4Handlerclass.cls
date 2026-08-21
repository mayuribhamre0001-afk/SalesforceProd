public class practice4Handlerclass 
{
    public static void handlermethod(List<Contact> Allcon)
    {
        List<Account> DupAcc = new List<Account>();
        
        for(Contact Eachcon : Allcon)
        {
            if(Eachcon.AccountId == null)
            {
                Account a = new Account();
                a.Name = (Eachcon.FirstName != null ? Eachcon.FirstName : '') + 
                         (Eachcon.LastName != null ? ' ' + Eachcon.LastName : '');
                a.BillingCity = Eachcon.MailingCity;
                a.BillingCountry = Eachcon.MailingCountry;
                a.Description = Eachcon.Description;
                a.Phone = Eachcon.Phone;
                
                DupAcc.add(a);
            }
        }
        
        if(!DupAcc.isEmpty()){
            insert DupAcc;
        }
    }


}