//
//  LoginViewController.swift
//  COMP90018Project
//
//  Created by Xuelin Zhao on 2017/10/6.
//  Copyright © 2017年 Microsoft. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let CP = ConfirmPassword()
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        CP.getResults()
        // Do any additional setup after loading the view.
        table = client.table(withName: "user")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var user = User()
    var passwordCorrect = false
    var usernameExist = false
    
    let client: MSClient = MSClient(applicationURLString: "https://comp90018project.azurewebsites.net")
    var table: MSTable = MSTable()
    
    var getUsername = "Get username"
    var getPassword = "Get password"
    var exist = false
    
    @IBAction func LoginButton(_ sender: UIButton) {
        //    CP.checkUserExisting(inputUsername: username.text!)
        //    usernameExist = CP.checkUserExisting(inputUsername: username.text!)
        //    passwordCorrect = CP.checkPassword(inputPassword: password.text!)
        // Create a predicate that finds items where complete is false
        let sqlQuery = "username == "+"\'"+username.text!+"\'"
        print(sqlQuery)
        let predicate =  NSPredicate(format: sqlQuery)
        // Query the TodoItem table
        table.read(with: predicate) { (result, error) in
            if let err = error {
                print("ERROR ", err)
            } else if let items = result?.items {
                for item in items {
                    print("item!!!!!!!!!!!!!")
                    if self.username.text! == item["username"] as! String{
                        if self.password.text! == item["password"] as! String {
                            self.user.username = self.username.text!
                            print("All Correct!!!!!!!")
                            Global.init(inputuser: self.user)
                      //segue to the main view
                        self.performSegue(withIdentifier: "login", sender: self)
                        }
                        else{
                            let alter = UIAlertView()
                            alter.title = "Incorrect!"
                            alter.message = "Password is incorrect!"
                            alter.addButton(withTitle: "ok")
                            alter.show()
                        }
                    }
                }
            }
            if result?.items?.count == 0{
                let alter = UIAlertView()
                alter.title = "Inexistence!"
                alter.message = "Please register one!"
                alter.addButton(withTitle: "ok")
                alter.show()
            }
        }
    }
}
