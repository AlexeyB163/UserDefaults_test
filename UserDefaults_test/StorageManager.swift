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
    
    
    func save(value: Contact) {
        var contacts = fetchContact()
        contacts.append(value)
        guard let data = try? JSONEncoder().encode(contacts) else  { return }
        userDefaults.set(data, forKey: key)
    }
    
    func fetchContact() -> [Contact] {
        guard let data = userDefaults.data(forKey: key) else { return []}
        guard let contacts = try? JSONDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
    
    func delete(at index: Int) {
        var contacts = fetchContact()
        contacts.remove(at: index)
        guard let data = try? JSONEncoder().encode(contacts) else {return}
        userDefaults.set(data, forKey: key)
    }
    
}
