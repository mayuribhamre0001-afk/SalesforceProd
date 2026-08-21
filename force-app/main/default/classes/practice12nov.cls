public class practice12nov implements database.batchable<sobject>
{
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        // Get users who have overdue tasks (due date older than 7 days)
        return Database.getQueryLocator([
            SELECT OwnerId
            FROM Task
            WHERE Status != 'Completed'
            AND ActivityDate < :Date.today().addDays(-1)
            AND OwnerId IN (SELECT Id FROM User WHERE IsActive = true)
        ]);
    }

    public void execute(Database.BatchableContext bc, List<SObject> scope)
    {
        // Collect User Ids with overdue tasks
        Set<Id> userIds = new Set<Id>();
        for (SObject s : scope)
        {
            Task t = (Task) s;
            userIds.add(t.OwnerId);
        }

        if (userIds.isEmpty()) return;

        // Get User emails
        List<User> users = [
            SELECT Id, Email, Name
            FROM User
            WHERE Id IN :userIds
        ];
		
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for (User u : users)
        {
            system.debug(u.email);
            // Prepare email
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[] { u.Email });
            mail.setSubject('Reminder: You Have Overdue Tasks');
            mail.setPlainTextBody(
                'Hello ' + u.Name + ',\n\n' +
                'You have tasks that are overdue by more than 7 days. ' +
                'Please log in to Salesforce and update them.\n\n' +
                'Thank you.'
            );

            emails.add(mail);
        }

        // Send emails (bulk send)
        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }

    public void finish(Database.BatchableContext bc)
    {
        System.debug('Overdue task reminder batch completed.');
    }
}