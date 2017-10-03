//
//  EmergencyMessage.swift
//  COMP90018Project
//
//  Created by Xuelin Zhao on 2017/10/3.
//  Copyright © 2017年 Microsoft. All rights reserved.
//

import Foundation
import CoreLocation

class EmergencyMessage{
var latitude = "0"

var longitude = "0"

var location = "location description"

var emergencyMessage = "This is the Emergency Message"
    
var address = "This is the address detail"

init() {
        
    }
    
//Save the emergency message into database
func saveItem(){
    let client = MSClient(applicationURLString: "https://comp90018project.azurewebsites.net")
    
    let itemTable:MSTable = client.table(withName: "emergencymsg")
    
    let itemToInsert = ["latitude":latitude, "longitude":longitude, "emergencymessage":emergencyMessage, "address":address] as [String : Any]
    
    itemTable.insert(itemToInsert) {
        (item, error) in
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        if error != nil {
            print("Error: " + (error! as NSError).description)
        }
    }
}
    
    
}
