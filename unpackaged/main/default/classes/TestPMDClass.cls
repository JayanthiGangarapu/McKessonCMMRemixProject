public class TestPMDClass {

    public List<Contact> getContactsByAccount(List<Id> accountIds) {
        List<Contact> contacts = new List<Contact>();
        
        // Loop through each account Id
        for(Id accId : accountIds) {
            // Perform SOQL query inside the loop
            List<Contact> accContacts = [SELECT Id, Name, Email FROM Contact WHERE AccountId = :accId];
            
            // Add the contacts to the list
            contacts.addAll(accContacts);
        }
        
        return contacts;
    }
}