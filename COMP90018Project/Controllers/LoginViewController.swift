//
//  LoginViewController.swift
//  COMP90018Project
//
//  Created by Xuelin Zhao on 2017/10/6.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit

// Login View Controller
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
        let sqlQuery = "username == "+"\'"+username.text!+"\'"
        print(sqlQuery)
        let predicate =  NSPredicate(format: sqlQuery)
        // Query the TodoItem table
        table.read(with: predicate) { (result, error) in
            if let err = error {
                print("ERROR ", err)
            } else if let items = result?.items {
                for item in items {
                    if self.username.text! == item["username"] as! String{
                        if self.password.text! == item["password"] as! String {
                            self.user.username = self.username.text!
                            self.user.ememail = item["emergencyemail"] as! String
                            self.user.phone = item["phonenum"] as! String
                            print("All Correct!")
                            
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? MainViewController
        controller?.user = self.user
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
