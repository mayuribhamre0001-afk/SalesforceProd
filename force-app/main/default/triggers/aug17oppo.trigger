trigger aug17oppo on Opportunity (before update) 
{
	for(opportunity op : trigger.new)
    {
        opportunity oldOp = trigger.oldmap.get(op.id);
        if(op.stagename == 'Closed Won' && oldop.stageName != 'Closed Won')
        {
            if(op.closeDate == null)
            {
                op.closeDate = date.today();
            }
        }
    }
}