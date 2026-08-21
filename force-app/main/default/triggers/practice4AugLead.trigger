trigger practice4AugLead on Lead (before insert) 
{
    for(lead ld : trigger.new)
    {
        if(string.isblank(ld.Description))
        {
            ld.description = 'New Lead Created';
        }
    }
}