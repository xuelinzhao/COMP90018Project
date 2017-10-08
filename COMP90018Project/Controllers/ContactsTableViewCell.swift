//
//  ContactsTableViewCell.swift
//  COMP90018Project
//
//  Created by 郭圣聪 on 8/10/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
