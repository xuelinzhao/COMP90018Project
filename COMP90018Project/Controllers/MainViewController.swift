//
//  MyViewController.swift
//  COMP90018Project
//
//  Created by 郭圣聪 on 4/10/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit
import Iconic
//import SwiftIconFont

class MainViewController: UIViewController {
    

    
    
    @IBOutlet weak var stateButton1: UIButton!
    @IBOutlet weak var stateButton2: UIButton!
    @IBOutlet weak var stateButton3: UIButton!
    @IBOutlet weak var stateButton4: UIButton!
    
    @IBOutlet weak var guardMeButton: UIButton!
    
    @IBOutlet weak var sosButton: UIButton!
    @IBOutlet weak var toolsButton: UIButton!
    
    var user = User()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // User Button

        
        // SOS Button
        sosButton.layer.cornerRadius = 20
        sosButton.clipsToBounds = true
        sosButton.setBackgroundColor(color: UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), forState: .normal)
        sosButton.setBackgroundColor(color: UIColor(red: 1, green: 0.575, blue: 0.5, alpha: 1), forState: .highlighted)
        
        
        // Tools Button
        toolsButton.layer.cornerRadius = 20
        toolsButton.clipsToBounds = true
        toolsButton.setBackgroundColor(color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), forState: .normal)
        toolsButton.setBackgroundColor(color: UIColor(red: 0.5, green: 0.76, blue: 1, alpha: 1), forState: .highlighted)
        
        // Guard Me Button
        guardMeButton.layer.cornerRadius = 20
        guardMeButton.clipsToBounds = true
        guardMeButton.setBackgroundColor(color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), forState: .normal)
        guardMeButton.setBackgroundColor(color: UIColor(red: 0.5, green: 0.76, blue: 1, alpha: 1), forState: .highlighted)
        
        stateButton1.setIconImage(withIcon: ._625Icon, size: CGSize(width: 60, height: 60), color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), forState: .normal)
        guardMeButton.setTitleColor(UIColor(white:1, alpha: 1), for: .normal)
        
        //        iconButton.parseIcon()
        stateButton1.setIconImage(withIcon: .sunIcon, size: CGSize(width: 60, height: 60), color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), forState: .normal)
        stateButton1.setIconImage(withIcon: .sunIcon, size: CGSize(width: 60, height: 60), color: UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), forState: .selected)
        
        stateButton1.setTitleColor(UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), for: .normal)
        stateButton1.setTitleColor(UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), for: .selected)
        
        stateButton1.layer.cornerRadius = 10
        stateButton1.clipsToBounds = true
        
        stateButton2.setIconImage(withIcon: .homeIcon, size: CGSize(width: 60, height: 60), color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), forState: .normal)
        stateButton2.setIconImage(withIcon: .homeIcon, size: CGSize(width: 60, height: 60), color: UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), forState: .selected)
        
        stateButton2.setTitleColor(UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), for: .normal)
        stateButton2.setTitleColor(UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), for: .selected)
        
        stateButton2.layer.cornerRadius = 10
        stateButton2.clipsToBounds = true
        
        stateButton3.setIconImage(withIcon: ._283Icon, size: CGSize(width: 60, height: 60), color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), forState: .normal)
        stateButton3.setIconImage(withIcon: ._283Icon, size: CGSize(width: 60, height: 60), color: UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), forState: .selected)
        
        stateButton3.setTitleColor(UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), for: .normal)
        stateButton3.setTitleColor(UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), for: .selected)
        
        stateButton3.layer.cornerRadius = 10
        stateButton3.clipsToBounds = true
        
        stateButton4.setIconImage(withIcon: ._303Icon, size: CGSize(width: 60, height: 60), color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), forState: .normal)
        stateButton4.setIconImage(withIcon: ._303Icon, size: CGSize(width: 60, height: 60), color: UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), forState: .selected)
        
        stateButton4.setTitleColor(UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), for: .normal)
        stateButton4.setTitleColor(UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), for: .selected)
        
        stateButton4.layer.cornerRadius = 10
        stateButton4.clipsToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! MapsViewController
        controller.user = self.user
    }
    
    
    // MARK: Button
    
    @IBAction func btnGuardMePressed(_ sender: UIButton) {
        // lead to map and time picker
         self.performSegue(withIdentifier: "tomap", sender: self)
    }
    
    @IBAction func btnSOSPressed(_ sender: UIButton) {
        // lead to contact table scene
    }
    
    
    @IBAction func button1Pressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        // state 1
        if sender.isSelected{
            self.user.emmessage = "I am Taking Taxi! I need your help!"
        }
    }
    
    
    @IBAction func button2Pressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        // state 2
        if sender.isSelected{
            self.user.emmessage = "I am Going Home! I need your help!"
        }
    }
    
    
    @IBAction func button3Pressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        // state 3
        if sender.isSelected{
            self.user.emmessage = "I am Traveling! I need your help!"
        }
    }
    
    
    @IBAction func button4Pressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        // state 4
        if sender.isSelected{
            self.user.emmessage = "I am Driving! I need your help!"
        }
    }
}


extension UIButton {
    
    func setBackgroundColor(color: UIColor, forState: UIControlState) {
        
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        //        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0.0)
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(colorImage, for: forState)
    }
}


