public class Employee 
{
    // Instance variables
    public String name;
    public Decimal salary;
    public Decimal bonusPercentage;

    // Constructor to initialize values
    public Employee(String name, Decimal salary, Decimal bonusPercentage) 
    {
        this.name = name;
        this.salary = salary;
        this.bonusPercentage = bonusPercentage;
    }

    // Method to calculate total salary
    public void calculateTotalSalary() 
    {
        Decimal TotalSalary = salary + (salary * bonusPercentage) / 100;
		system.debug(TotalSalary);        
    }
}