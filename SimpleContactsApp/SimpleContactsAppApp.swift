//
//  SimpleContactsAppApp.swift
//  SimpleContactsApp
//
//  Created by MAC on 8/14/22.
//

import SwiftUI

@main
struct SimpleContactsAppApp: App {
    
    @StateObject var contactsListViewModel : ContactsListViewModel = ContactsListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            ContactsListView()
                .environmentObject(contactsListViewModel)
        }
        
}
}
