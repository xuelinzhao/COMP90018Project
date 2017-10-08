//
//  Contact.swift
//  COMP90018Project
//
//  Created by 郭圣聪 on 8/10/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import Foundation
import UIKit


class Contact {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var phoneNumber: String
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, phoneNumber: String) {
        
        guard !name.isEmpty else {
            return nil
        }
        
        guard !phoneNumber.isEmpty else {
            return nil
        }
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.phoneNumber = phoneNumber
    }
}
