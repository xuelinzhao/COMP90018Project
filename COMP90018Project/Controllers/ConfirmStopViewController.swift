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
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let vews: [UIViewController] = (self.navigationController?.viewControllers)!
//        
//        if  vews.count > 0 {
//            
//            for vew in vews{
//                print( type(of: vew))
//            }
//            
//        }
        // Do any additional setup after loading the view.
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
  
    
    @IBAction func ConfirmPIN(_ sender: UIButton) {
        stopFlag = cp.checkStopPIN(PIN: StopPIN)
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
    
//    override func  prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let MapsView = segue.destination as! MapsViewController
//        MapsView.stopFlag = false
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


