public class DuplicateRemaval 
{
    list<string> Allname = new list<string>{'mayuri', 'akash', 'shraddha', 'leo', 'mayuri', 'simba', 'akash', 'shraddha'};
        
        set<string> newname = new set<string>{};
            
     public void method()
        {
            for(string eachname : Allname)
            {
                newname.add(eachname);
            }
            system.debug(newname);
        }
}