//
//  NewContactViewController.swift
//  UserDefaults_test
//
//  Created by User on 12.03.2022.
//

import UIKit

class NewContactViewController: UIViewController {

    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var surnameTF: UITextField!
    
    var fullName: String {
        "\(firstNameTF.text) \(surnameTF.text)"
    }
    
    var delegate:ContactListDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func saveButton() {
        
        guard let firstName = firstNameTF.text else { return }
        guard let surname = surnameTF.text else { return }
        let contact = Contact(firstName: firstName, surname: surname)
        delegate.saveUser(value: contact)
        StorageManager.shared.save(value: contact)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
