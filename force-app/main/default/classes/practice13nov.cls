public class practice13nov 
{
    public void method()
	{
        string subject = 'HELLO WORLD';
        string body = 'WELCOME TO SALESFORCE';
        list<string> Allmail = new list<string>{'mayurib0001@gmail.com', 'mayuribhamre0001@gmail.com'};
            
        messaging.singleEmailMessage Email = new messaging.singleEmailMessage();
        Email.SettoAddresses(Allmail);
        Email.setsubject(subject);
        Email.setplaintextbody(body);
        
        list<messaging.singleEmailMessage> send = new list<messaging.singleEmailMessage>{Email};
        messaging.sendEmail(send);
        
        system.debug('Mail sent successfully');
    }
}