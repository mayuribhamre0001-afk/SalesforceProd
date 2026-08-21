trigger practice4 on Contact (before insert) 
{
    list<contact> Allcon = Trigger.new;
    // List to hold new Accounts to create
    List<Account> accsToInsert = new List<Account>();           

    // Map contact temp Id → account
    Map<Id, Account> contactIdToAccount = new Map<Id, Account>();

    for (Contact con : Allcon) 
    {
        if (con.AccountId == null) 
        {
            // Create a new account for this contact
            Account acc = new Account(
                Name = (con.FirstName != null ? con.FirstName : '') + 
                       (con.LastName != null ? ' ' + con.LastName : ''),
                Phone = con.Phone,
                BillingCity = con.MailingCity,
                BillingCountry = con.MailingCountry,
                Description = con.Description
            );

            accsToInsert.add(acc);

            // Temporarily link the Contact → Account (after insert we'll fix Ids)
            contactIdToAccount.put(con.Id, acc);
        }
    }

    if (!accsToInsert.isempty()) 
    {
        insert accsToInsert;

        // Assign the newly inserted Account Ids back to the related Contacts
    }
}