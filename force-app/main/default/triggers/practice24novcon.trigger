trigger practice24novcon on Contact (before insert) 
{
    list<string>Allmail = new list<string>{};
    for(contact eachcon: trigger.new)
    {
        if(eachcon.Email != null)
        {
            Allmail.add(eachcon.Email);
        }
    }
    map<string, contact>Allcon = new map<string, contact>(
        [select id, email from contact where email IN : Allmail]
        );
    for(contact C : Trigger.new)
    {
        if(C.email != null && Allcon.containskey(C.email))
        {
            C.adderror('This Email already exists');
        }
    }
}