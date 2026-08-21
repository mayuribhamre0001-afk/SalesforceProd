public class exencapsulation
{
    private String accountName; // Encapsulated variable

    // Setter method
    public void setAccountName(String name) {
        this.accountName = name;
        system.debug(accountName);
    }

    // Getter method
    public String getAccountName() {
        return accountName;
        
    }
}