//
//  ConfirmPassword.swift
//  COMP90018Project
//
//  Created by Xuelin Zhao on 2017/10/6.
//  Copyright © 2017年 Microsoft. All rights reserved.
//

import Foundation

class ConfirmPassword{
    
    var user: String = "username"
    var password: String = "password"
    var phone: String = "phonenumber"
    var emergencyPhone = "energeneyPhone"
    var emergencyEmail = "emergencyEmail;"
    
    init() {
        
    }
    
    func checkStopPIN(PIN:String)->Bool{
        if PIN == "1111"{
            return true
        }else{
            return false
        }
        }
}
