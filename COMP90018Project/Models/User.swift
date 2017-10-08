//
//  User.swift
//  COMP90018Project
//
//  Created by Xuelin Zhao on 2017/10/6.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import Foundation

// Model of User
class User{
    var username = "username"
    var password = "password"
    var phone = "phone"
    var email = "email"
    var emphone = "emergency phone"
    var ememail = "emergency email"
    var emmessage = "I need your help!!!"
    
    func saveUser(){
        let client = MSClient(applicationURLString: "https://comp90018project.azurewebsites.net")
        
        let itemTable:MSTable = client.table(withName: "user")
        
        let itemToInsert = ["username":username, "password":password, "phonenum":phone, "email":email,"emergencynumber":emphone,"emergencyemail":ememail] as [String : Any]
        
        itemTable.insert(itemToInsert) {
            (item, error) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if error != nil {
                print("Error: " + (error! as NSError).description)
            }
        }
    }
    
}
