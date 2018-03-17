//
//  ChatTableViewController.swift
//  PioneerHacksProject
//
//  Created by Mehul Tailang on 3/16/18.
//  Copyright © 2018 Mehul Tailang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ChatViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputTextField: UITextField!
    
    var messageArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func sendMessage(_ sender: UIButton) {
        print("\(String(describing: Auth.auth().currentUser?.uid))")
        let ref = Database.database().reference().child("messages")
        let user = Auth.auth().currentUser?.email
        
        let values = ["text": inputTextField.text!, "email": user]
        ref.childByAutoId().setValue(values) {
            (error, reference) in
            if error != nil {
                print(error!)
            }
            else {
                print("Message saved")
                self.messageArray.append(self.inputTextField.text!)
                self.tableView.reloadData()
            }
        }
    }
    
    
  
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = messageArray[indexPath.row]
        return cell
    }
    
    
    
    
    
    
}
