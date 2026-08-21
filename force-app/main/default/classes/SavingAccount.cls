public class SavingAccount extends BankAccount
{
    public Decimal interestRate;

    // Constructor
    public SavingAccount(String name, Decimal initialBalance, Decimal rate) {
        super(name, initialBalance);
        this.interestRate = rate;
    }

    // Apply interest method
    public void applyInterest() {
        Decimal interest = balance * interestRate;
        balance += interest;
        System.debug('Interest of ' + interest + ' applied. New Balance: ' + balance);
    }
}