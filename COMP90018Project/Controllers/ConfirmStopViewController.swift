//
//  ConfirmStopViewController.swift
//  COMP90018Project
//
//  Created by Xuelin Zhao on 2017/10/6.
//  Copyright © 2017年 Microsoft. All rights reserved.
//

import UIKit

class ConfirmStopViewController: UIViewController {

    
    @IBOutlet weak var PassOne: UILabel!
    @IBOutlet weak var PassTwo: UILabel!
    @IBOutlet weak var PassThree: UILabel!
    @IBOutlet weak var PassFour: UILabel!
    
    var password:String = ""
    
    @IBAction func TouchDigit(_ sender: UIButton) {
        if PassOne.text != "_"{
            if PassTwo.text != "_"{
                if PassThree.text != "_"{
                    if PassFour.text != "_"{
                        print(password)
                    }else{
                        PassFour.text = sender.currentTitle
                        password.append(sender.currentTitle!)
                    }
                }else{
                    PassThree.text = sender.currentTitle
                    password.append(sender.currentTitle!)
                }
            }else{
                PassTwo.text = sender.currentTitle
                password.append(sender.currentTitle!)
            }
        }else{
            PassOne.text = sender.currentTitle
            password.append(sender.currentTitle!)
        }
    }
    
    @IBAction func ConfirmPassword(_ sender: UIButton) {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
