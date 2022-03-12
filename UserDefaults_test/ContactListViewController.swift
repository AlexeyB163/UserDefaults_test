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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
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
    
}

extension ContactListViewController: ContactListDelegate {
    func saveUser(fullName: String) {
        contacts.append(fullName)
    }
    
    
}

