//
//  StorageManager.swift
//  UserDefaults_test
//
//  Created by User on 12.03.2022.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    let userDefaults = UserDefaults()
    let key = "contact"

   private init () {}
    
    
    func save(value: String) {
        var contacts = fetchContact()
        contacts.append(value)
        userDefaults.set(contacts, forKey: key)
    }
    
    func fetchContact() -> [String] {
        if let contact = userDefaults.value(forKey: key) as? [String] {
            return contact
        }
            return []
    }
    
    func delete(at index: Int) {
        var contacts = fetchContact()
        contacts.remove(at: index)
        userDefaults.set(contacts, forKey: key)
    }
    
}
