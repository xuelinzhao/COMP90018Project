//
//  SetEmergencyMessageViewController.swift
//  COMP90018Project
//
//  Created by Xuelin Zhao on 2017/10/3.
//  Copyright © 2017年 Microsoft. All rights reserved.
//

import UIKit
import CoreLocation

class SetEmergencyMessageViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation : CLLocation = locations.last!
        print("\(currentLocation.coordinate.latitude)")
        label1.text = "\(currentLocation.coordinate.latitude)"
        label2.text = "\(currentLocation.coordinate.longitude)"
    }
    
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
        print(error)
    }
}

