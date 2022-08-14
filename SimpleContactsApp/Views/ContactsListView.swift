//
//  SwiftUIView.swift
//  SimpleContactsApp
//
//  Created by MAC on 8/14/22.
//

import SwiftUI



struct ContactsListView: View {
    
    
    @EnvironmentObject var contactsListViewModel : ContactsListViewModel
    @State var showSheetView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contactsListViewModel.contacts) { contact in
                    EachContactView(contacts: contact)
                }
                
       }	
            .navigationBarTitle("Contacts".capitalized)
       .navigationBarTitleDisplayMode(.inline)
            
       .listStyle(PlainListStyle())
    //   .groupBoxStyle(DefaultGroupBoxStyle())
        .navigationBarItems(
            leading: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Groups")
                }),
        
            trailing: Button(action: {
                self.showSheetView.toggle()
                
                
                }, label: {
            Image(systemName: "plus")
                .font(Font.system(.title2))
        }
            )
            )
        }.sheet(isPresented: $showSheetView) {
            AddContactView(showSheetView: self.$showSheetView)
        }
    }
    
}
            
       
  
struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView()
            .environmentObject(ContactsListViewModel())
        
}
}



