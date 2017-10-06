//
//  RegisterViewController.swift
//  COMP90018Project
//
//  Created by Xuelin Zhao on 2017/10/6.
//  Copyright © 2017年 Microsoft. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmpassword: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var emphone: UITextField!
    @IBOutlet weak var ememail: UITextField!

//   var usernameContent = self.username.text!
//  var passwordContent = self.password.text!
//    var emailContent = self.email.text!
//    var phoneContent = self.phone.text!
//    var ememailContent = self.ememail.text!
//    var emphoneContent = self.emphone.text!
    
    var user1 = User()
    var user = User()
    
    @IBAction func RegisterNextButton(_ sender: UIButton) {
        user1.username = self.username.text!
        user1.password = self.password.text!
        user1.email = self.email.text!
        user1.phone = self.phone.text!
    }
    
    @IBAction func Register(_ sender: UIButton) {
        user.ememail = self.ememail.text!
        user.emphone = self.emphone.text!
        user.saveUser()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ec = segue.destination as! RegisterViewController
        ec.user = user1
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
