//
//  SignUpViewController.swift
//  PioneerHacksProject
//
//  Created by Mehul Tailang on 3/16/18.
//  Copyright © 2018 Mehul Tailang. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signUpPressed(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (user, err) in
            if err != nil {
                print(err!)
            }
            else {
                print("success")
            }
        }
    }
    
    
    

}
