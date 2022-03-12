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
        "\(firstNameTF.text ?? "") \(surnameTF.text ?? "")"
    }
    
    var delegate:ContactListDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func saveButton() {
        
        delegate.saveUser(fullName: fullName)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
