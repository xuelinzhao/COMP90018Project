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

class MyViewController: UIViewController {
    
    @IBOutlet weak var sosButton: UIButton!
    @IBOutlet weak var toolsButton: UIButton!
    @IBOutlet weak var guardMeButton: UIButton!
    
    @IBOutlet weak var stateButton1: UIButton!
    @IBOutlet weak var stateButton2: UIButton!
    @IBOutlet weak var stateButton3: UIButton!
    @IBOutlet weak var stateButton4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // SOS Button
        self.sosButton.layer.cornerRadius = 20
        self.sosButton.clipsToBounds = true
        self.sosButton.setBackgroundColor(color: UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), forState: .normal)
        self.sosButton.setBackgroundColor(color: UIColor(red: 1, green: 0.575, blue: 0.5, alpha: 1), forState: .highlighted)
    
        
        // Tools Button
        self.toolsButton.layer.cornerRadius = 20
        self.toolsButton.clipsToBounds = true
        self.toolsButton.setBackgroundColor(color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), forState: .normal)
        self.toolsButton.setBackgroundColor(color: UIColor(red: 0.5, green: 0.76, blue: 1, alpha: 1), forState: .highlighted)
        
        // Guard Me Button
        self.guardMeButton.layer.cornerRadius = 20
        self.guardMeButton.clipsToBounds = true
        self.guardMeButton.setBackgroundColor(color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), forState: .normal)
        self.guardMeButton.setBackgroundColor(color: UIColor(red: 0.5, green: 0.76, blue: 1, alpha: 1), forState: .highlighted)
        self.guardMeButton.setTitleColor(UIColor(white:1, alpha: 1), for: .normal)
        
        //        iconButton.parseIcon()
        stateButton1.setIconImage(withIcon: .sunIcon, size: CGSize(width: 50, height: 40), color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), forState: .normal)
        stateButton1.setIconImage(withIcon: .sunIcon, size: CGSize(width: 50, height: 40), color: UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), forState: .selected)
        
        stateButton1.layer.cornerRadius = 10
        stateButton1.clipsToBounds = true
       
        stateButton2.setIconImage(withIcon: ._279Icon, size: CGSize(width: 50, height: 40), color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), forState: .normal)
        stateButton2.setIconImage(withIcon: ._279Icon, size: CGSize(width: 50, height: 40), color: UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), forState: .selected)
        
        stateButton2.layer.cornerRadius = 10
        stateButton2.clipsToBounds = true
        
        stateButton3.setIconImage(withIcon: ._283Icon, size: CGSize(width: 50, height: 40), color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), forState: .normal)
        stateButton3.setIconImage(withIcon: ._283Icon, size: CGSize(width: 50, height: 40), color: UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), forState: .selected)
        
        stateButton3.layer.cornerRadius = 10
        stateButton3.clipsToBounds = true
        
        stateButton4.setIconImage(withIcon: ._303Icon, size: CGSize(width: 50, height: 40), color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), forState: .normal)
        stateButton4.setIconImage(withIcon: ._303Icon, size: CGSize(width: 50, height: 40), color: UIColor(red: 1, green: 0.15, blue: 0, alpha: 1), forState: .selected)
        
        stateButton4.layer.cornerRadius = 10
        stateButton4.clipsToBounds = true
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
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        commonInit()
//    }
    
//    func commonInit() -> Void {
//
//        let tabItem = UITabBarItem(withIcon: .pictureIcon, size: CGSize(width: 20, height: 20), title: "As Image")
//
//        self.title = tabItem.title
//        self.tabBarItem = tabItem
//
//        let buttonItem = UIBarButtonItem(withIcon: .cogIcon, size: CGSize(width: 24, height: 24), target: self, action: #selector(didTapRightItem))
//        self.navigationItem.rightBarButtonItem = buttonItem
//    }
//
//    @objc func didTapRightItem() {
//        // Do something
//    }
    
    
    @IBAction func btnSOSPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func button1Pressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
    }
    
    
    @IBAction func button2Pressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
    }
    
    
    @IBAction func button3Pressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
    }
    
    
    @IBAction func button4Pressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
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

