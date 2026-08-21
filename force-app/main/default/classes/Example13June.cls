public class Example13June implements database.batchable<Sobject>
{
    public Iterable<Sobject> Start(database.batchableContext BAC)
    {
        list<account>Allacc = [select id, name, phone, fax, billingCity, description from account];
        Return Allacc;
    }
    
    public void execute(database.batchablecontext BAC, list<account> batchdata)
    {
        for(account acc: batchdata)
        {
            list<account>accountstoupdate = new list<account>{};
            if(acc.billingCity!= null)
            {
                if(acc.description ==null)
                {
                    acc.description = 'Location = '+acc.billingcity;
                    accountstoupdate.add(acc);
                }
                
            }
            else
            {
                acc.description = 'No Location';
                accountstoupdate.add(acc);
            }
                    update accountstoupdate;
        }
    }
    
    public void finish(database.batchablecontext BAC)
    {
        AsyncApexJob Aj = [select id, ApexClassId, CompletedDate, JobItemsProcessed, JobType, MethodName, NumberOfErrors, Status, TotalJobItems from AsyncApexJob where id =: BAC.getjobid()];
        If(Aj.status== 'completed')
        {
            string subject = 'The '+Aj.Jobtype+' is '+Aj.Status+' on '+Aj.CompletedDate+' with '+Aj.NumberOfErrors+' number of errors.';
            string body = 'The '+Aj.Jobtype+' is '+Aj.Status+' on '+Aj.CompletedDate+' with '+Aj.NumberOfErrors+' number of errors.';
            
            list<string> MailList = new list<string>{'mayuribhamre0001@gmail.com','mayurib0001@gmail.com'};
                
            messaging.singleEmailMessage E = New messaging.singleEmailMessage();
            try
            {
            E.setsubject('hdjhc');
            }
            catch(exception ef)
            {
                system.debug(ef);
            }
                
            E.setplaintextbody(body);
            E.settoaddresses(MailList);
            
            list<messaging.singleEmailMessage> tosend = new list<messaging.singleEmailMessage>{E};
            messaging.sendemail(tosend);
        }
        else
        {            
            string subjectF = 'Important : The '+Aj.Jobtype+' is '+Aj.Status+' on '+Aj.CompletedDate+' with '+Aj.NumberOfErrors+' number of errors.';
            string bodyF = 'Important : The '+Aj.Jobtype+' is '+Aj.Status+' on '+Aj.CompletedDate+' with '+Aj.NumberOfErrors+' number of errors.';
            
            list<string> MailListF = new list<string>{'mayuribhamre0001@gmail.com','mayurib0001@gmail.com'};
                
            messaging.singleEmailMessage EF = New messaging.singleEmailMessage();
            
            EF.setsubject(subjectF);
            EF.setplaintextbody(bodyF);
            EF.settoaddresses(MailListF);
            
            list <messaging.singleEmailMessage> sendF = new list<messaging.singleEmailMessage>{EF};
            messaging.sendemail(sendF);
        }
    }

}