trigger accountContact on Contact (after insert) 
{
    list<contact>Allcon = Trigger.new;
    list<account>AllAcc = [select name, phone, id from account];
    
    for(contact eachcon : Allcon)
    {
        for(account EachAcc : AllAcc)
        {
            if(eachcon.accountid != null)
            {
                eachcon.phone = EachAcc.phone;
            }
        }
    }
}