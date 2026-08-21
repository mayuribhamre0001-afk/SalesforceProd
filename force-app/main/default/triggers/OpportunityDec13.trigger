trigger OpportunityDec13 on Opportunity (before insert) 
{
	for(opportunity eachOp : Trigger.new)
    {
        if(eachOp.Amount == null || eachOp.Amount <= 0)
        {
            eachOp.amount = 1000;
        }
    }
}