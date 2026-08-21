public class Example17June implements schedulable
{
    public void execute(schedulableContext S)
    {
        list<contact> allcon = [select firstname, lastname, mailingcity, email, mailingcountry, fax from contact];
        
        list<messaging.singleemailmessage> send = new list<messaging.singleemailmessage>{};
        for(contact eachcon : allcon)
        {
            if(eachcon.email!=null || eachcon.email!='nomail@gmail.com')
            {
                messaging.singleemailmessage E = new messaging.singleemailmessage();
                
                list<string> tosend = new list<string>{eachcon.email};
                    string subject = 'Happy New Year Dear '+eachcon.FirstName+' from Mayuri Bhamre.';
                    string body = 'Congratulations! Dear '+eachcon.FirstName+' you received one Family Holiday for '+eachcon.lastname+' family. Congratulations to all '+eachcon.lastname+' family members.';
                    
                    E.settoaddresses(tosend);
                    E.setsubject(subject);
                    E.setplaintextbody(body);
                
                send.add(E);
              if(send!=null)
              {
                  messaging.sendemail(send);
              }
                
            }
        }
    }

}