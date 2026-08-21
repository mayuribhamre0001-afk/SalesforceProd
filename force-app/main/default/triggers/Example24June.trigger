trigger Example24June on Contact (before insert) 
{
   list<contact> Allcon = Trigger.new;
    
    for(contact EachCon : Allcon)
    {
        if(EachCon.Phone == null)
        {
            eachcon.phone = '00000';
        }
        if(EachCon.Email == null)
        {
            EachCon.Email = 'no@gmail.com';
        }

    }
   
}