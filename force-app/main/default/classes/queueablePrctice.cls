public class queueablePrctice implements queueable
{
    list<id>opId;
    public queueablePrctice(list<id>opId)
    {
        opId = this.opId;
    }
	public void execute(system.queueableContext QC)
    {
        list<opportunity>allOp = [SELECT Id, Name, stageName, closeDate FROM Opportunity WHERE Id IN : opId];
        system.debug('job done');
    }
}