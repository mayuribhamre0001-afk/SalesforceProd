trigger practice11Dec2 on Contact (before insert) 
{
    for(contact eachcon : trigger.new)
    {
        eachcon.description = 'Created on - '+date.today();
    }
}