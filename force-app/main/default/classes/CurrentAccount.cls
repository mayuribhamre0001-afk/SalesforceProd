public class CurrentAccount extends BankAccount
{ 
    public Decimal overdraftLimit;

    // Constructor
    public CurrentAccount(String name, Decimal initialBalance, decimal alimit) 
    {
        super(name, initialBalance);
        this.overdraftLimit = alimit;
    }

    // Override withdraw method to allow overdraft
    public override void withdraw(Decimal amount) {
        if (amount <= balance + overdraftLimit) {
            balance -= amount;
            System.debug('Withdrew: ' + amount + ', New Balance: ' + balance);
        } else {
            System.debug('Withdrawal amount exceeds overdraft limit.');
        }
    }

    // Check overdraft method
    public void checkOverdraft() {
        System.debug('Overdraft Limit: ' + overdraftLimit + ', Available Funds: ' + (balance + overdraftLimit));
    }
}