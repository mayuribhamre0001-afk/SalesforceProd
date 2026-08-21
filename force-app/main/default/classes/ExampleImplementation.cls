public class ExampleImplementation implements Database.Batchable<SObject>
{
    Public Database.Querylocator Start(Database.BatchableContext BAC)
    {
        Return Database.getQueryLocator('select id, firstname, lastname, phone, email, fax from contact');
    }
    Public Void Execute(Database.BatchableContext BAC, List<contact>AllData)
    {
       List<contact>AllContacttoUpdate = New List<Contact>{};
           
       for(contact eachcon : Alldata)

       {
           if(eachcon.email ==null)
           {
               eachcon.email = 'noemail@gmail.com';
           }
           AllContacttoUpdate.add(eachcon);
       }
        
		   Update AllContacttoUpdate;
        
    }
    Public Void Finish(Database.BatchableContext BAC)
    {
        system.debug(BAC.GetJobId());
        
        AsyncApexJOb Aj = [Select CompletedDate, JobItemsProcessed, JobType, MethodName, NumberOfErrors, Status from AsyncApexJob where Id =: BAC.GetJobId()];
        
        string subject = 'The'+Aj.jobtype+ 'Job is '+Aj.status+' with '+Aj.numberoferrors+ ' number of errors';
        string plainbody = 'The job is completed on '+Aj.completedDate;
        
        messaging.singleEmailMessage E = New messaging.singleEmailMessage();
        List<string>allmails = new list<string> {'mayuribhamre0001@gmail.com','mayurib0001@gmail.com','pushkar.bangde6@gmail.com', 'pushkar.bangde6@gmail.com'};
        
        E.setsubject(subject);
        E.setPlainTextBody(plainbody);
        E.settoAddresses(allmails);
        
        list<messaging.singleEmailMessage> send = new list<messaging.singleEmailMessage>{E};
        
        messaging.sendemail(send);    }
}