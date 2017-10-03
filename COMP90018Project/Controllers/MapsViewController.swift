//
//  MapsViewController.swift
//  COMP90018Project
//
//  Created by Xuelin Zhao on 2017/10/3.
//  Copyright © 2017年 Microsoft. All rights reserved.
//

import UIKit
import GoogleMaps
    
    class MapsViewController: UIViewController,CLLocationManagerDelegate {
        
        // You don't need to modify the default init(nibName:bundle:) method.
        let locationManager = CLLocationManager()
        var latitude: Double = 0.0
        var longitude: Double = 0.0
        var lock = NSLock()
        
        let em = EmergencyMessage()
        
        override func viewDidLoad() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = 10
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            print("Start Loaction")
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            //Get the latitude and longitude
            lock.lock()
            let currentLocation : CLLocation = locations.last!
            latitude = Double("\(currentLocation.coordinate.latitude)")!
            longitude = Double("\(currentLocation.coordinate.longitude)")!
            lock.unlock()
            
            //Show Google Map View
            let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 12)
            let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            mapView.isMyLocationEnabled = true
            view = mapView
            
            LonLatToCity(currentLocation: currentLocation)
            
            //Pin Marker
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            marker.map = mapView

           
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
                    
                    print(addressDetail)
                    
                    
                }
                else
                {
                    print(error!)
                }
            }
            
        }
        
        
}
