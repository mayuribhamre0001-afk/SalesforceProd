trigger VIPContact on Contact (before insert) 
{
    for(contact eachcon : trigger.new)
    {
        if(eachcon.salutation == 'CEO')
        {
        	eachcon.Is_VIP__c = true;
        }
    }
}