public class april15HandlerClass 
{    
	public static void method(list<contact>newlist)
    {
    	set<string>mails = new set<string>{};
		for(contact c : newlist)
        {
            if(c.email != null)
            {
                mails.add(c.Email);
            }
        }
        set<string>existingCon = new set<string>{};
        for(contact con : [SELECT email FROM Contact WHERE email IN : mails])
        {
            existingCon.add(con.Email);
        }
        set<string>seenmails = new set<string>{};
        for(contact c : newlist)
        {
            string mail = c.Email;
            if(existingCon.contains(mail) || seenmails.contains(mail))
            {
                c.adderror('NANANANANA nana');
            }
            else{
                seenmails.add(mail);
            }
        }
    }
}