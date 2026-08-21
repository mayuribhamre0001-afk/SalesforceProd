public class flightsmail 
{

	public void sendemail()
    {
        messaging.singleEmailMessage mail = new messaging.singleEmailMessage();
        list<string> AllMail= new list<string>{'mayuribhamre0001@gmail.com', 'mayurib0001@gmail.com'};
        mail.setsubject('Hello mam');
		Mail.setplaintextbody('hello this is sample mail from flight schedule');
        mail.settoaddresses(AllMail);
        
        list<messaging.singleEmailMessage> M = new list<messaging.singleEmailMessage>{mail};
            messaging.sendEmail(m);
    }

}