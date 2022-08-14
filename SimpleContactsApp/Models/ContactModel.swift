//
//  ContactModel.swift
//  SimpleContactsApp
//
//  Created by MAC on 8/14/22.
//

import Foundation

struct ContactModel: Identifiable, Codable {
    let id : String = UUID().uuidString
    let contact : String
   
    
}
