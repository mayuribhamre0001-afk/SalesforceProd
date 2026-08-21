trigger opportunityTrigger on Opportunity (after update) 
{
    OppHandlerClass.oppMethod(trigger.new, trigger.oldmap);
}