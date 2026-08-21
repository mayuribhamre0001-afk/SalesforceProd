trigger accountIndustry on Account (before insert, after insert) 
{
    if(trigger.isInsert && trigger.isBefore)
    {
   		accountIndustrtyhandlerClass.validationMethod(trigger.new);
    }
    if(trigger.isInsert && trigger.isAfter)
    {
   		accountIndustrtyhandlerClass.contactCreation(trigger.new);
    }
}