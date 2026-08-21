public class ExampleEmail2 
{
    Public Database.Querylocator Start(Database.BatchableContext BAC)
    {
        Return Database.getQueryLocator('select id, name from account');
    }
    Public Void Execute(Database.BatchableContext BAC, List<account>AllData)
    {
       List<account>AllContacttoUpdate = New List<account>{};
           
       for(account eachname : Alldata)

       {
               eachname.Name = eachname.Name+'';
           
           AllContacttoUpdate.add(eachname);
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
        List<string>allmails = new list<string> {'mayuribhamre0001@gmail.com','mayurib0001@gmail.com','pushkar.bangde6@gmail.com'};
        
        E.setsubject(subject);
        E.setPlainTextBody(plainbody);
        E.settoAddresses(allmails);
        
        list<messaging.singleEmailMessage> send = new list<messaging.singleEmailMessage>{E};
        
        messaging.sendemail(send);
    }
}