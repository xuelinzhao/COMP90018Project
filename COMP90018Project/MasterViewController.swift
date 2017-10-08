//
//  MasterViewController.swift
//  COMP90018Project
//
//  Created by 郭圣聪 on 4/10/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit
import Iconic
//import SwiftIconFont

class MasterViewController: UIViewController {
    

    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    
    
    @IBOutlet weak var stateButton1: UIButton!
    @IBOutlet weak var stateButton2: UIButton!
    @IBOutlet weak var stateButton3: UIButton!
    @IBOutlet weak var stateButton4: UIButton!
    
    @IBOutlet weak var guardMeButton: UIButton!
    
    @IBOutlet weak var sosButton: UIButton!
    @IBOutlet weak var toolsButton: UIButton!

    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Colors
        let white = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        let red = UIColor(red: 1, green: 0.15, blue: 0, alpha: 1)
        let blue = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        
        // User Button
        topLeftButton.setIconImage(withIcon: .thListIcon, size: CGSize(width: 30, height: 30), color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), forState: .normal)
        topLeftButton.setIconImage(withIcon: .sunIcon, size: CGSize(width: 60, height: 60), color: UIColor(red: 0, green: 0.234, blue: 0.5, alpha: 1), forState: .highlighted)
        
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
//        guardMeButton.setBackgroundColor(color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), forState: .normal)
        guardMeButton.setBackgroundColor(color: UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1), forState: .highlighted)
//
//        guardMeButton.setTitleColor(UIColor(white:1, alpha: 1), for: .normal)
        
        // MARK: State Buttons
        
        let buttonSize = CGSize(width: 60, height: 100)
        
        stateButton1.layer.cornerRadius = 10
        stateButton1.clipsToBounds = true
        
        stateButton1.setIconImage(withIcon: .sunIcon, size: buttonSize, color: white, forState: .normal)
        stateButton1.setIconImage(withIcon: .sunIcon, size: buttonSize, color: red, forState: .selected)
        stateButton1.positionLabelRespectToImage(title: stateButton1.title(for: .normal)!, position: .bottom, spacing: 0)
        
//        stateButton1.setTitleColor(UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), for: .normal)
//        stateButton1.setTitleColor(UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), for: .selected)
       
        stateButton2.layer.cornerRadius = 10
        stateButton2.clipsToBounds = true
        
        stateButton2.setIconImage(withIcon: .homeIcon, size: buttonSize, color: white, forState: .normal)
        stateButton2.setIconImage(withIcon: .homeIcon, size: buttonSize, color: red, forState: .selected)
        stateButton2.positionLabelRespectToImage(title: stateButton2.title(for: .normal)!, position: .bottom, spacing: 0)
        
//        stateButton2.setTitleColor(UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), for: .normal)
//        stateButton2.setTitleColor(UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), for: .selected)
        
        stateButton3.layer.cornerRadius = 10
        stateButton3.clipsToBounds = true
        
        stateButton3.setIconImage(withIcon: ._283Icon, size: buttonSize, color: white, forState: .normal)
        stateButton3.setIconImage(withIcon: ._283Icon, size: buttonSize, color: red, forState: .selected)
        stateButton3.positionLabelRespectToImage(title: stateButton3.title(for: .normal)!, position: .bottom, spacing: 0)
        
//        stateButton3.setTitleColor(UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), for: .normal)
//        stateButton3.setTitleColor(UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), for: .selected)
        
        stateButton4.layer.cornerRadius = 10
        stateButton4.clipsToBounds = true
        
        stateButton4.setIconImage(withIcon: ._303Icon, size: buttonSize, color: white, forState: .normal)
        stateButton4.setIconImage(withIcon: ._303Icon, size: buttonSize, color: red, forState: .selected)
        stateButton4.positionLabelRespectToImage(title: stateButton4.title(for: .normal)!, position: .bottom, spacing: 0)
        
//        stateButton4.setTitleColor(UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), for: .normal)
//        stateButton4.setTitleColor(UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), for: .selected)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

    
    // MARK: Button
    
    @IBAction func btnGuardMePressed(_ sender: UIButton) {
        
        // lead to map and time picker
        
        
    }
    
    @IBAction func btnSOSPressed(_ sender: UIButton) {
        // lead to contact table scene
    }
    
    
    @IBAction func button1Pressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        // state 1
    }
    
    
    @IBAction func button2Pressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        // state 2
    }
    
    
    @IBAction func button3Pressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        // state 3
    }
    
    
    @IBAction func button4Pressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        // state 4
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
    
    func positionLabelRespectToImage(title: String, position: UIViewContentMode,
                                     spacing: CGFloat) {
        let imageSize = self.imageRect(forContentRect: self.frame)
        let titleFont = self.titleLabel?.font!
        let titleSize = title.size(withAttributes: [NSAttributedStringKey.font: titleFont!])
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}

