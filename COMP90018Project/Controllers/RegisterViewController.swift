//
//  RegisterViewController.swift
//  COMP90018Project
//
//  Created by Xuelin Zhao on 2017/10/6.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit

// Register View Controller
class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmpassword: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var emphone: UITextField!
    @IBOutlet weak var ememail: UITextField!
    
    var user1 = User()
    var user = User()
    let CP = ConfirmPassword()
    var stopFlag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password?.isSecureTextEntry = true
        confirmpassword?.isSecureTextEntry = true
    }
    
    @IBAction func RegisterNextButton(_ sender: UIButton) {
        
        user1.username = self.username.text!
        
        if(self.password.text == self.confirmpassword.text){
            user1.password = self.password.text!
            stopFlag = true
        }else{
            stopFlag = false
            let alter = UIAlertView()
            alter.title = "Info Incorrect"
            alter.message = "The passwords are not the same! "
            alter.addButton(withTitle: "ok")
            alter.show()
        }
        user1.email = self.email.text!
        user1.phone = self.phone.text!
        let ec = self.storyboard?.instantiateViewController(withIdentifier: "ECVC") as! RegisterViewController
        if stopFlag {
            ec.user = user1
            self.navigationController?.pushViewController(ec, animated: true)
        }
    }
    
    @IBAction func Register(_ sender: UIButton) {
        user.ememail = self.ememail.text!
        user.emphone = self.emphone.text!
        user.saveUser()
        let alter = UIAlertView()
        alter.title = "Success!"
        alter.message = "Register Successfully!"
        alter.addButton(withTitle: "ok")
        alter.show()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
