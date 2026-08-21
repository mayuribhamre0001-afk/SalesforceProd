public class example2ndMay implements database.batchable<sObject>
{
    public database.queryLocator Start(database.batchableContext BAC)
    {
		return database.getQueryLocator('SELECT Id, Phone FROM Contact');
    }
    public void execute(database.batchableContext BAC, list<contact>scope)
    {
        for(contact con : scope)
        {
                con.phone = '1112222111';
        }
        update scope;
    }
    public void finish(database.batchableContext BAC)
    {
		system.debug(BAC.GetJobId());
        asyncApexJob Aj = [SELECT CompletedDate, JobItemsProcessed, JobType, NumberOfErrors, Status, TotalJobItems FROM AsyncApexJob WHERE Id =: BAC.GetJobId()];
        list<string>mailId = new list<string>{'mayuribhamre0001@gmail.com', 'mayurib0001@gmail.com'};
        messaging.singleEmailMessage mail = new messaging.singleEmailMessage();
        
        mail.setToAddresses(mailId);
        mail.setSubject('Batch Job Update');
        mail.setPlainTextBody('Dear user, Batch Job is '+Aj.status+' with '+Aj.TotalJobItems+' no. of contacts. In '+Aj.JobType+' with '+Aj.NumberOfErrors+' number of errors. ');
        
        list<messaging.singleEmailMessage> M = new list<messaging.singleEmailMessage>{mail};
            messaging.sendEmail(M);
        
        system.debug('Dear user, Batch Job is '+Aj.status+' with '+Aj.TotalJobItems+' no. of contacts. In '+Aj.JobType+' with '+Aj.NumberOfErrors+' number of errors. ');
    }
}