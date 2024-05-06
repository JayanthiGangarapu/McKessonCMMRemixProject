@isTest
public class TestTestPMDClass {
    @isTest
    static void testGetContactsByAccount() {
        // Create test data - Accounts and Contacts
        Account testAccount1 = new Account(Name='Test Account 1');
        Account testAccount2 = new Account(Name='Test Account 2');
        insert new List<Account>{testAccount1, testAccount2};
        
        Contact testContact1 = new Contact(AccountId = testAccount1.Id, FirstName='John', LastName='Doe', Email='john.doe@test.com');
        Contact testContact2 = new Contact(AccountId = testAccount1.Id, FirstName='Jane', LastName='Smith', Email='jane.smith@test.com');
        Contact testContact3 = new Contact(AccountId = testAccount2.Id, FirstName='Bob', LastName='Johnson', Email='bob.johnson@test.com');
        insert new List<Contact>{testContact1, testContact2, testContact3};
        
        // Call the method from the class being tested
        TestPMDClass TestPMDClass = new TestPMDClass();
        List<Id> accountIds = new List<Id>{testAccount1.Id, testAccount2.Id};
        List<Contact> resultContacts = TestPMDClass.getContactsByAccount(accountIds);
        
        // Verify the results
        System.assertEquals(3, resultContacts.size(), 'Number of contacts should match');
        
    }
}