trigger practice5AugOppo on Opportunity (after update) 
{
 	for(opportunity op : trigger.new)
    {
        opportunity oldOp = trigger.oldmap.get(op.Id);
        If(oldOp.StageName == 'Closed Won' && op.StageName != 'Closed Won')
        {
            op.adderror('Closed Opportunity stage cannot be changed');
        }
    }
}