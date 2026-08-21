trigger Opportunitycount on Opportunity (before insert) 
{
   list<opportunity> Allop = Trigger.new;
   
    for(opportunity eachop : Allop)
    {
        if(eachop.stagename == null)
        {
            eachop.stagename = 'Prospecting';
        }
    }
}