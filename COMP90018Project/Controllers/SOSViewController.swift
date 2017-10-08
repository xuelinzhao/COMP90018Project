//
//  SOSViewController.swift
//  COMP90018Project
//
//  Created by 郭圣聪 on 4/10/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit

class SOSViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    @IBAction func btnCancelPressed(_ sender: Any) {
                self.dismiss(animated: true, completion:nil)
    }
}
