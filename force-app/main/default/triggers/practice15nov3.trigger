trigger practice15nov3 on Lead (before insert) 
{
    for(lead eachlead : trigger.new)
    {
        if(eachlead.rating == null)
        {
            eachlead.rating = 'Warm';
        }
    }
}