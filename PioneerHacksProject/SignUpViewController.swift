//
//  SignUpViewController.swift
//  PioneerHacksProject
//
//  Created by Mehul Tailang on 3/16/18.
//  Copyright © 2018 Mehul Tailang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

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
                let ref = Database.database().reference()
                let value = ["Email": self.emailText.text!, "Password": self.passwordText.text!]
                ref.child("Users").child(user!.uid).setValue(value)
                //let vc = ChatViewController()
                //self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
    
    
    


