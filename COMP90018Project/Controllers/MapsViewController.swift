//
//  MapsViewController.swift
//  COMP90018Project
//
//  Created by Xuelin Zhao on 2017/10/3.
//  Copyright © 2017年 Microsoft. All rights reserved.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController,CLLocationManagerDelegate,UIPickerViewDelegate, UIPickerViewDataSource {
    
    // You don't need to modify the default init(nibName:bundle:) method.
    
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    var zoomLevel: Float = 20.0
    
    let em = EmergencyMessage()
    
    override func viewDidLoad() {
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 5
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        print("Start Loaction")
        
        let camera = GMSCameraPosition.camera(withLatitude: 35.0,longitude: 35.0,zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height*0.85), camera: camera)
        mapView.settings.myLocationButton = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.isMyLocationEnabled = true
        
        // Add the map to the view, hide it until we've got a location update.
        
        view.addSubview(mapView)
        
        mapView.isHidden = true
        
    }
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
        
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
            LonLatToCity(currentLocation: location)
        } else {
            mapView.animate(to: camera)
        }
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
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
    
    //Timer Section
    var leftTime:Int = 5
    var timer :Timer!
    
    @IBOutlet weak var TimerLabel: UILabel!
    
    @IBAction func CountButton(_ sender: UIButton) {
       
        stopFlag = false
        //get left time
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(tickDown), userInfo: nil, repeats: true)
    }
    
    //get selected index
    func getPickerViewValue(pickerView:UIPickerView)-> String{
        let message = String(pickerView.selectedRow(inComponent: 0))
        return message
    }
    
    var stopFlag = false
    
    //Pop into password confirm view
    @IBAction func StopButton(_ sender: UIButton) {
        //stopFlag = true
    }
    
    @objc func tickDown() {
        //minus 1 second
        leftTime -= 1
        print(leftTime)
        //update left time
        let timeCount = getTimeCount(leftTimeCount: leftTime)
        TimerLabel.text = timeCount
        //if lefte time <= 0 or stop confirmed
        if leftTime <= 0 || stopFlag {
            //delete timer
            timer.invalidate()
            TimerLabel.text = "Time up"
            let alter = UIAlertView()
//            alter.title = "Time up"
//            alter.message = "Time up"
//            alter.addButton(withTitle: "Confirm")
//            alter.show()
        }
    }
    
    //Format the time count
    func getTimeCount(leftTimeCount: Int) -> String{
        var leftTimeCounts = leftTimeCount
        var timeCount: String = String(leftTimeCount)
        var hour: Int = leftTimeCount
        var minute: Int = leftTimeCount
        var second: Int = leftTimeCount
        
        if (leftTimeCounts-leftTimeCounts%3600)/3600>0{
            hour = (leftTimeCounts-leftTimeCounts%3600)/3600
            leftTimeCounts -= hour*3600
            print("Hour: \(hour)")
        }else{
            hour = 0
        }
        
        if (leftTimeCounts-leftTimeCounts%60)/60>0{
            minute = (leftTimeCounts-leftTimeCounts%60)/60
            leftTimeCounts -= minute*60
            print("Minute: \(minute)")
        }else{
            minute = 0
        }
        
        if(leftTimeCounts<60){
            second = leftTimeCounts
        }
        
        if minute<10{
            timeCount = "0\(hour)"+":"+"0\(minute)"+":"+"\(second)"
        }else{
            timeCount = "0\(hour)"+":"+"\(minute)"+":"+"\(second)"
        }
        
        print(timeCount)
        return timeCount
    }
    
    @IBAction func SelectDate(_ sender: UIButton) {
        let alertController:UIAlertController = UIAlertController(title: "Select Time\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        var popover = alertController.popoverPresentationController
        if (popover != nil){
            popover?.sourceView = sender
            popover?.sourceRect = sender.bounds
            popover?.permittedArrowDirections = UIPopoverArrowDirection.any
        }
        
        // initiate Picker
        var pickerView = UIPickerView()
        //dataSource
        pickerView.dataSource = self
        //delegate
        pickerView.delegate = self
        //default content
        pickerView.selectRow(1,inComponent:0,animated:true)
        alertController.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default){
            (alertAction)->Void in
            
            self.getPickerViewValue(pickerView: pickerView)
            
        })
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel,handler:nil))
        alertController.view.addSubview(pickerView)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //1 Column, inherited from UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //5 rows, inherited from UIPickerViewDataSource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    //Set width of pickerview
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        return view.bounds.width
//    }
    
    //comtents，inherited from UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
                    forComponent component: Int) -> String? {
        if(row == 0){
            TimerLabel.text = "5 Minutes"
            self.leftTime = 5*60
            return "5 Minutes"
        }
        if(row == 1){
            self.leftTime = 10*60
            TimerLabel.text = "10 Minutes"
            return "10 Minutes"
        }
        if(row == 2){
            self.leftTime = 30*60
            TimerLabel.text = "30 Minutes"
            return "30 Minutes"
        }
        if(row == 3){
            self.leftTime = 1*60*60
            TimerLabel.text = "1 Hour"
            return "1 Hour"
        }
        if(row == 4){
            self.leftTime = 2*60*60
            TimerLabel.text = "2 Hours"
            return "2 Hours"
        }
        return String(row)+"-"+String(component)
    }
    
    
}

