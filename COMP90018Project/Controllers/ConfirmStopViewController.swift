//
//  ConfirmStopViewController.swift
//  COMP90018Project
//
//  Created by Xuelin Zhao on 2017/10/6.
//  Copyright © 2017年 Microsoft. All rights reserved.
//
protocol ParameterDelegate{
    func passParams(tmpStr: Bool)
}

import UIKit

// Confirm StopPIN View Controller
class ConfirmStopViewController: UIViewController  {
    
    
    @IBOutlet weak var PassOne: UILabel!
    @IBOutlet weak var PassTwo: UILabel!
    @IBOutlet weak var PassThree: UILabel!
    @IBOutlet weak var PassFour: UILabel!
    
    var StopPIN:String = ""
    var stopFlag = false
    var delegate: ParameterDelegate?
    let em = EmergencyMessage()
    let cp = ConfirmPassword()
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Stop!!!"+user.phone)
    }
    
    @IBAction func TouchDigit(_ sender: UIButton) {
        if PassOne.text != "_"{
            if PassTwo.text != "_"{
                if PassThree.text != "_"{
                    if PassFour.text != "_"{
                        print(StopPIN)
                    }else{
                        PassFour.text = sender.currentTitle
                        StopPIN.append(sender.currentTitle!)
                    }
                }else{
                    PassThree.text = sender.currentTitle
                    StopPIN.append(sender.currentTitle!)
                }
            }else{
                PassTwo.text = sender.currentTitle
                StopPIN.append(sender.currentTitle!)
            }
        }else{
            PassOne.text = sender.currentTitle
            StopPIN.append(sender.currentTitle!)
        }
    }
  
    //Confirm stopPIN
    @IBAction func ConfirmPIN(_ sender: UIButton) {
        stopFlag = cp.checkStopPIN(PIN: StopPIN, phone: user.phone)
        if stopFlag{
            print("StopPIN Correct!")
            self.delegate?.passParams(tmpStr: stopFlag)
     self.navigationController?.popViewController(animated: true)
            
        }else{
            let alter = UIAlertView()
            alter.title = "Incorrect"
            alter.message = "PIN incorrect!"
            alter.addButton(withTitle: "ok")
            alter.show()
            PassOne.text = "_"
            PassTwo.text = "_"
            PassThree.text = "_"
            PassFour.text = "_"
            StopPIN = ""
        }
    }
    
    //Backspace
    @IBAction func DeleteButton(_ sender: UIButton) {
        if PassFour.text == "_"{
            if PassThree.text == "_"{
                if PassTwo.text == "_"{
                    if PassOne.text == "_"{
                        
                    }else{
                        PassOne.text = "_"
                    }
                }else{
                    PassTwo.text = "_"
                }
            }else{
                PassThree.text = "_"
            }
        }else{
            PassFour.text = "_"
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


