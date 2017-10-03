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
    
    @IBOutlet weak var latitudelabel: UILabel!
    @IBOutlet weak var longitudelabel: UILabel!
    @IBOutlet weak var emessage: UITextView!
    
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
        latitudelabel.text = "\(currentLocation.coordinate.latitude)"
        longitudelabel.text = "\(currentLocation.coordinate.longitude)"
    }
    
    
    @IBAction func Save(_ sender: UIButton) {
        let em = EmergencyMessage()
        print(latitudelabel.text!)
        print(longitudelabel.text!)
        em.latitude = latitudelabel.text!
        em.longitude = longitudelabel.text!
        em.emergencyMessage = emessage.text!
        em.saveItem()
        
    }
    
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
        print(error)
    }
}

