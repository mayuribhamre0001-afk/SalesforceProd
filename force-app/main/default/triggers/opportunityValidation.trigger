trigger opportunityValidation on Opportunity (before update) 
{
	for(opportunity op : trigger.new)
    {
        opportunity oldop = trigger.oldmap.get(op.Id);
        if(op.stageName == 'Closed Won' && oldop.stageName != 'Closed Won')
        {
            if(op.amount == null || op.Amount <10000)
            {
                op.adderror('Opportunity amount must be atleast 10000');
            }
        }
    }
}