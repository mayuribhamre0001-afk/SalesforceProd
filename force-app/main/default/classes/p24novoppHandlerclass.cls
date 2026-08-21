public class p24novoppHandlerclass 
{
	public static void method(opportunity eachop, list<id>allId, boolean updt)
    {
        if (updt == true)
        {
            string subject = 'Opportunity Closed Lost';
        string body = 'Dear '+eachop.OwnerId+'\n\n Opportunity - '+eachop.Name+' is Closed Lost. \n\n Please check for further details. ';
        messaging.SingleEmailMessage A = new messaging.SingleEmailMessage();
        A.setsubject(subject);
        A.setplaintextbody(body);
        A.settoaddresses(allId);
        
        list<messaging.SingleEmailMessage> Mail = new list<messaging.SingleEmailMessage>{A};
            Messaging.sendEmail(Mail);
            
            system.debug('mail sent');
        }
    }
}