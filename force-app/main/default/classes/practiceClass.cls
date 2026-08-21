public class practiceClass 
{
    list<contact> Allcon = [select firstname, lastname, phone, email from contact];
    
    public void method()
    {
        for(integer i=0; i < Allcon.size(); i++)
        {
            system.debug(Allcon[i].firstname+' '+Allcon[i].lastname);
        }
    }
    
}