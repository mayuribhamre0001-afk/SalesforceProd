public class duplicateAccountPrehandler 
{
    public static boolean firstrun = true;
    
	public static void duplicateMethod(list<account>allAcc)
    {
        list<account>newacc = new list<account>{};
        for(account ac : allAcc)
        {
            account a = new account();
            a.Name = ac.Name;
            a.Phone = '1234567878';
            
            newacc.add(a);
        }
        insert newacc;
    }
}