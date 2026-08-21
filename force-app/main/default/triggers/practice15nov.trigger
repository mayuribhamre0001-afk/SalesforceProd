trigger practice15nov on Account (before delete) 
{
    // Query related Opportunities for the Accounts being deleted
    Map<Id, Account> accWithOpps = new Map<Id, Account>(
        [SELECT Id, (SELECT Id FROM Opportunities) 
         FROM Account 
         WHERE Id IN :Trigger.old]
    );

    for (Account acc : Trigger.old) {
        if (!accWithOpps.get(acc.Id).Opportunities.isEmpty()) {
            acc.addError('This Account cannot be deleted because it has related Opportunities.');
        }
    }
}