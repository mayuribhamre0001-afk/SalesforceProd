public with sharing class emailclass 
{
    @auraEnabled
    public static void sendEmail(Id contactId, string Subject, string Body) 
    {
        contact con =[select Id, Name, Email from Contact where Id=:contactID];
        if(con.Email == null)
        {
            throw new AuraHandledException('This contact does not have an email address.');
        }
        
        messaging.singleEmailMessage mail = New messaging.singleEmailMessage();
        mail.setSubject(Subject);
        mail.setPlainTextBody('Hi '+con.Name+',\n\n'+Body+'\n\n Regards');
        mail.settoaddresses(new string[]{con.Email});

        messaging.sendEmail(new messaging.singleEmailMessage[]{mail});
    }
}