public class accountIndustrtyhandlerClass 
{
	public static void validationMethod(list<account>newList)
    {
        for(account a : newList)
        {
            if(a.phone == null)
            {
                a.adderror('Phone cannot be empty');
            }
        }
    }
    public static void contactCreation(list<account>newList)
    {
        list<contact>conList = new list<contact>{};
        for(account a : newList)
        {
            conList.add(new contact(LastName=a.name, phone = a.phone, accountId = a.id));
        }
        insert conList;
    }
}