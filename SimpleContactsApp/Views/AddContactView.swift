//
//  AddContactView.swift
//  SimpleContactsApp
//
//  Created by MAC on 8/14/22.
//

import SwiftUI

struct AddContactView:  View {
    
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var contactsListViewModel : ContactsListViewModel
    
    @Binding var showSheetView: Bool
    
    @State private var firstName = ""
    @State private var secondName = ""
    @State private var company = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ProfileImage()
                    .padding()
               
              
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("add photo".capitalized)
                    })
               Spacer()
                Form {
                    Section {
    
                    HStack {
                        TextField("First Name", text: $firstName)
                    }
                    HStack {
                        TextField("Second Name", text: $secondName)
                    }
                    HStack {
                        TextField("Company", text: $company)
                    }
                    }
                 
                    Section {
                        HStack {
                            Button(action: {}, label: {
                                Label {
                                    Text("add phone")
                                        .foregroundColor(.black)
                                } icon: {
                                   Image(systemName: "plus.circle.fill")
                                    .renderingMode(.template)
                                    .foregroundColor(.green)
                            }
                        }
                        )
                    }
                }
                    Section {
                        HStack {
                            Button(action: {}, label: {
                                Label {
                                    Text("add email")
                                        .foregroundColor(.black)
                                } icon: {
                                   Image(systemName: "plus.circle.fill")
                                    .renderingMode(.template)
                                    .foregroundColor(.green)
                            }
                        }
                        )
                    }
                }
                    Section {
                        HStack {
                            Picker(selection: .constant(1), label: Text("Ringtone"), content: {
                                Text("").tag(1)
                                Text("").tag(2)
                            })
                        }
                    }
                    
                    Section {
                        HStack {
                            Picker(selection: .constant(1), label: Text("Text Tone"), content: {
                                Text("").tag(1)
                                Text("").tag(2)
                            })
                        }
                    }
                    
                }
                
                
            }
            
            .navigationBarTitle(Text("new contact".capitalized), displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.showSheetView = false
            }, label: {
                Text("Cancel")
            }), trailing: Button(action: SaveContact , label: { Text("Done")
            }))
        }
    }
    
    func SaveContact () {
        contactsListViewModel.AddContact(contactss: firstName)
//        contactsListViewModel.AddContact(contactss: secondName)
        presentationMode.wrappedValue.dismiss()
        
        
        
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView(showSheetView: .constant(false))
            .environmentObject(ContactsListViewModel())
    }
}



struct ProfileImage: View {
    var body: some View {
      Image(systemName: "person.crop.circle.fill")
        .resizable()
        .renderingMode(.template)
        .foregroundColor(.gray)
        .frame(width: 100, height: 100)
        .clipShape(Circle())
    }
    
}

