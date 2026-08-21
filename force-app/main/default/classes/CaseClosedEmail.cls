public class CaseClosedEmail implements queueable
{
    private set<id>allid;
    public CaseClosedEmail(set<Id> Allid)
    {
        this.Allid = Allid;
    }
	public void execute(System.QueueableContext QC)
    {
        list<case>Cases = [select id, CaseNumber from case WHERE ID IN : AllId];
        
        list<string>email = new list<string>{'mayurib0001@gmail.com'};
        list<messaging.singleEmailMessage> send = new list<messaging.singleEmailMessage>{};

        for(case eachcase : Cases)
		{      
            Messaging.singleEmailMessage M = new messaging.singleEmailMessage();
            M.setToAddresses(email);
            M.setSubject('Case is closed');
            M.setPlainTextBody('Case - '+eachcase.id+' is Closed');
            
            send.add(M);
        }    
        messaging.sendEmail(send);
    	
    }
}