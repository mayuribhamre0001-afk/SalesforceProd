public virtual class BankAccount 
{
    public String accountHolderName;
    public Decimal balance;

    // Constructor
    public BankAccount(String name, Decimal initialBalance) 
    {
        this.accountHolderName = name;
        this.balance = initialBalance;
    }

    // Deposit method
    public void deposit(Decimal amount) 
    {
        if (amount > 0) 
        {
            balance += amount;
            System.debug('Deposited: ' + amount + ', New Balance: ' + balance);
        } else 
        {
            System.debug('Deposit amount must be positive.');
        }
    }

    // Withdraw method
    public virtual void withdraw(Decimal amount) 
    {
        if (amount <= balance) 
        {
            balance -= amount;
            System.debug('Withdrew: ' + amount + ', New Balance: ' + balance);
        } 
        else 
        {
            System.debug('Insufficient balance.');
        }
    }
    public void method(integer a , integer b)
    {
         a += b;
        system.debug(a);
    }
}