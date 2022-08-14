//
//  EachContactView.swift
//  SimpleContactsApp
//
//  Created by MAC on 8/14/22.
//

import SwiftUI

struct EachContactView: View {
    let contacts : ContactModel
    var body: some View {
        HStack {
            Text(contacts.contact)
               // .padding()
        }
    }
}

struct EachContactView_Previews: PreviewProvider {
    
    static var contact1 = ContactModel(contact: "this is it")
    
    static var previews: some View {
        EachContactView(contacts: contact1)
    }
}
