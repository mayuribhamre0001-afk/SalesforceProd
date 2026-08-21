trigger closedate on Opportunity (before insert)
{
    for(opportunity op : trigger.new)
    {
        if(op.Amount < 10000)
        {
            op.adderror('Opportunity amount cannot be less than 10000');
        }
    }
}