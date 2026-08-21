trigger practice14June on Contact (before insert, before update) 
{
    set<string>mails = new set<string>{};
    for(contact con : trigger.new)
    {
        if(con.email != null)
        {
            mails.add(con.email.toLowerCase());
        }
    }
    set<string>existingMails = new set<string>{};
	for(contact con : [SELECT Email FROM Contact WHERE Email IN : mails])
    {
        existingMails.add(con.Email.tolowercase());
    }
    set<string>seenMail = new set<string>{};
      
    for(contact con : trigger.new)
    {
        string conmail = con.email.tolowerCase();
        if(existingMails.contains(conmail) || seenMail.contains(conmail))
        {
            con.adderror('Email already exists');
        }
        else{
            seenMail.add(conmail);
        }
    }
}