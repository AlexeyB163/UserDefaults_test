//
//  ContactListViewController.swift
//  UserDefaults_test
//
//  Created by User on 12.03.2022.
//

import UIKit

protocol ContactListDelegate {
    func saveUser(fullName: String)
}

class ContactListViewController: UIViewController {

    var contacts:[String] = []
    
    @IBOutlet weak var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        contacts = StorageManager.shared.fetchContact()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newContactVC = segue.destination as? NewContactViewController else { return }
        newContactVC.delegate = self
    }

    @IBAction func addContactButton(_ sender: UIBarButtonItem) {
    }
    
}

extension ContactListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellUser", for: indexPath) as! ContactTableViewCell
        cell.fullName.text = contacts[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            StorageManager.shared.delete(at: indexPath.row)
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

extension ContactListViewController: ContactListDelegate {
    func saveUser(fullName: String) {
        contacts.append(fullName)
        tableView.reloadData()
    }
    
    
}

