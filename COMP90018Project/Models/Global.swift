//
//  Global.swift
//  COMP90018Project
//
//  Created by Xuelin Zhao on 2017/10/7.
//  Copyright © 2017年 Microsoft. All rights reserved.
//

import Foundation

class Global{
    var user :User
    init(inputuser:User) {
        user = inputuser
    }
    
    func getUser() -> User{
        return self.user
    }
    
    func setUser(userInput: User) {
        self.user = userInput
    }
}
