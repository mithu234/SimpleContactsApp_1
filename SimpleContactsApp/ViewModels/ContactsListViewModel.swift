//
//  ContactsListViewModel.swift
//  SimpleContactsApp
//
//  Created by MAC on 8/14/22.
//

import Foundation

class ContactsListViewModel : ObservableObject {
    
    @Published var contacts : [ContactModel] = [] {
        didSet {
            SavingContact()
        }
    }
       
    
    let contactKey : String = "contact_key"
    
    init() {
        ContactList()
    }
    
    func ContactList() {

        guard
            let contactData = UserDefaults.standard.data(forKey: contactKey),
            let savedContactList = try? JSONDecoder().decode([ContactModel].self, from: contactData)
        else { return }
        
        self.contacts = savedContactList
    }
    
    
    func AddContact(contactss : String) {
        let newContact = ContactModel(contact: contactss)
        contacts.append(newContact)
    }
    
    func SavingContact() {
        if let saveContacts = try? JSONEncoder().encode(contacts) {
            UserDefaults.standard.set(saveContacts, forKey: contactKey)
            print("well done")
        }
    }
    
    
    
    
    
}
