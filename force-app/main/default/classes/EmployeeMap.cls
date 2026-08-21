public class EmployeeMap 
{
    public void printEmployee()
    {
       map<integer, string> allempl = new map<integer, string>{101=>'Amit', 102=>'Neha', 103=>'Rohan', 104=>'Mayuri', 105=>'Leo'};

       for(Integer empId : allempl.keySet())
       {
           system.debug('Employee ID = '+empId+' , Name = '+allempl.get(empId));
       }
    }

}