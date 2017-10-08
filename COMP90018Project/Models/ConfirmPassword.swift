//
//  ConfirmPassword.swift
//  COMP90018Project
//
//  Created by Xuelin Zhao on 2017/10/6.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import Foundation

// Models of confirm password and stopPIN
class ConfirmPassword{
    var user: String = "username"
    var password: String = "password"
    var phone: String = "phonenumber"
    var emergencyPhone = "energeneyPhone"
    var emergencyEmail = "emergencyEmail;"
    
    let client:MSClient
    let table:MSTable
    
    init() {
        client = MSClient(applicationURLString: "https://comp90018project.azurewebsites.net")
        table = client.table(withName: "user")
    }
    
    
    func checkStopPIN(PIN:String, phone:String)->Bool{
        let startIndex = phone.index(phone.startIndex, offsetBy: phone.lengthOfBytes(using: .utf8) - 4)
        let endIndex = phone.index(startIndex, offsetBy:4)
        let correctPIN = phone.substring(with: startIndex..<endIndex)
        print("correctPIN"+correctPIN)
        if PIN == correctPIN{
            return true
        }else{
            return false
        }
    }
    
    func getResults(){
        table.read { (result, error) in
            if let err = error {
                print("ERROR ", err)
            } else if let items = result?.items {
                for item in items {
                    print("Username: ", item["username"]!)
                }
            }
        }
    }
    
    var getUsername = "Get username"
    var getPassword = "Get password"
    var exist = false
    
    func checkPassword(inputPassword: String) -> Bool{
        if inputPassword == getPassword{
            return true
        }else{
            return false
        }
    }
    
    func checkUserExisting(inputUsername: String) -> Bool{
        print(getUsername+"GGGGGGGGGGGG")
        print(getPassword+"GGGGGGGGGGGG")
        getUserInfo(inputUsername: inputUsername)
        return exist
    }
    
    
    func getUserInfo(inputUsername: String) -> Bool{
        // Create a predicate that finds items where complete is false
        var sqlQuery = "username == "+"\'"+inputUsername+"\'"
        print(sqlQuery)
        let predicate =  NSPredicate(format: sqlQuery)
        // Query the TodoItem table
        table.read(with: predicate) { (result, error) in
            if let err = error {
                print("ERROR ", err)
            } else if let items = result?.items {
                for item in items {
                    self.exist = true
                    self.getUsername = item["username"] as! String
                    self.getPassword = item["password"] as! String
                    print("Username!!!!: ", item["username"]!)
                    print("Password!!!!: ", item["password"]!)
                }
            }
        }
        
        return exist
    }
    
}
