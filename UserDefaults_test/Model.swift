//
//  Model.swift
//  UserDefaults_test
//
//  Created by User on 12.03.2022.
//

import Foundation

struct User {
    let firstName: String?
    let surname: String?
    
    var fullName: String {
        "\(firstName) \(surname)"
    }
}
