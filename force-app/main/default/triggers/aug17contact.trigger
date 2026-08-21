trigger aug17contact on Contact (before insert)
{
	for(contact con : trigger.new)
    {
        if(con.LastName != null)
        {
        	con.LastName = con.LastName.toUpperCase();
        }
    }
}