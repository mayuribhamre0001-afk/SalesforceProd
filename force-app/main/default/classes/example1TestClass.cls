@isTest
public class example1TestClass 
{
	@isTest
    public static void method()
    {
        list<contact>allCon = new list<contact>{};
        for(integer i = 0; i<10; i++)
        {
            contact c = new contact();
            c.FirstName = 'demo'+i;
			c.LastName = 'contact'+i;
            
            allCon.add(c);
        }
        insert allcon;
        
        test.startTest();
        
        example2ndMay batch = new example2ndMay();
        database.executebatch(batch);
        test.stopTest();
        
        list<contact>updatedlist = [SELECT Phone FROM Contact WHERE Id IN :allCon];
        
        for(contact con : updatedlist)
        {
            system.assertEquals('1112222111',con.phone);
            system.debug('TEST Successfull' +con.phone);
        }
    }
}