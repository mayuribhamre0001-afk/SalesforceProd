public class Student 
{
    String name;
    integer age;
    integer grade;
    
    public student(string name)
    {
        system.debug(name+' this is first method');
    }
    public student(string name, integer age)
    {
        system.debug(name+' = ' +age+' years. This is second method');
        
    }
    public student(string name, integer age, integer grade)
    {
        system.debug(name+' = '+age+' years, Grade = '+grade+' This is third method');
    }

}