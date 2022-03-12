//
//  ContactTableViewCell.swift
//  UserDefaults_test
//
//  Created by User on 12.03.2022.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    @IBOutlet weak var fullName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

