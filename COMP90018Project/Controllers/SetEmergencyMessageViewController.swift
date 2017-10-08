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
    
    //Location
    var locationManager = CLLocationManager()
    let em = EmergencyMessage()
    var address = "Location"
    
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emessage.text = "I am "+user.username+". "+user.emmessage
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 5
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        print("Start Loaction")
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
    
    // Save and send emergency message to emergency contact
    @IBAction func Save(_ sender: UIButton) {
        print(latitudelabel.text!)
        print(longitudelabel.text!)
        
        em.latitude = latitudelabel.text!
        em.longitude = longitudelabel.text!
        em.emergencyMessage = emessage.text!
        em.address = address
        var emmsg:String = em.emergencyMessage+" My location is "+em.address
        sendEmail(emmessage: emmsg, emcontact: user.ememail)
        em.saveItem()
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
        print(error)
    }
    
    //Get the address detail
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
    
    func sendEmail(emmessage:String, emcontact:String){
        // prepare json data
        print(emmessage + emcontact)
        let json: [String: Any] = ["message": emmessage,
                                   "contact": emcontact
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://comp90018project.azurewebsites.net/api/sendEmail")!
        var request = URLRequest(url: url)
        
        
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        request.httpMethod = "POST"
        
        
        // insert json data to the request
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        
        task.resume()
    }
}


