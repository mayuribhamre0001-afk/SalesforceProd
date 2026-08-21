public class RelatedContactHandler {

    public static void createContacts(List<Account> accountList) {
        
        List<Contact> contactList = new List<Contact>();
        
        for (Account acc : accountList) {
            contactList.add(new Contact(
                LastName = acc.Name,
                AccountId = acc.Id,
                Phone = acc.Phone
            ));
        }
        
        if (!contactList.isEmpty()) {
            
            Database.SaveResult[] results = 
                Database.insert(contactList, false); // partial success allowed
            
            for (Integer i = 0; i < results.size(); i++) {
                
                if (!results[i].isSuccess()) {
                    for (Database.Error err : results[i].getErrors()) {
                        System.debug('Error inserting Contact: ' + err.getMessage());
                    }
                }
            }
        }
    }
}