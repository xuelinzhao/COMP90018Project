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
    let em = EmergencyMessage()
    var address = "This is the address"
    
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
        LonLatToCity(currentLocation: currentLocation)
    }
    
    
    @IBAction func Save(_ sender: UIButton) {
        print(latitudelabel.text!)
        print(longitudelabel.text!)
        em.latitude = latitudelabel.text!
        em.longitude = longitudelabel.text!
        em.emergencyMessage = emessage.text!
        em.address = address
        em.saveItem()
    }
    
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
        print(error)
    }
    
    //Get the address
    func LonLatToCity(currentLocation : CLLocation) -> Void {
        let geocoder: CLGeocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(currentLocation) { (placemark, error) -> Void in
            if(error == nil)
            {
                let array = placemark! as NSArray
                let mark = array.firstObject as! CLPlacemark
                //City
                let city: String = (mark.addressDictionary! as NSDictionary).value(forKey: "City") as! String
                //Country
                let country: NSString = (mark.addressDictionary! as NSDictionary).value(forKey: "Country") as! NSString
                //CountryCode
                let CountryCode: NSString = (mark.addressDictionary! as NSDictionary).value(forKey: "CountryCode") as! NSString
                //Address
                let FormattedAddressLines: NSString = ((mark.addressDictionary! as NSDictionary).value(forKey: "FormattedAddressLines") as AnyObject).firstObject as! NSString
                //Name
                let Name: NSString = (mark.addressDictionary! as NSDictionary).value(forKey: "Name") as! NSString
                //State
                let State: String = (mark.addressDictionary! as NSDictionary).value(forKey: "State") as! String
                //SubLocality
                let SubLocality: NSString = (mark.addressDictionary! as NSDictionary).value(forKey: "SubLocality") as! NSString
                
                
                //Address detail
                var addressDetail: String = (FormattedAddressLines as String)+" "+(SubLocality as String)+" "+city+" "+State+" "+(country as String)+" "+(CountryCode as String)+" latitude: "+"\(currentLocation.coordinate.latitude)"+" longitude: "+"\(currentLocation.coordinate.longitude)"
                self.address = addressDetail
                print(addressDetail)
                
                
        }
            else
            {
                print(error!)
            }
        }
        
    }
}

