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

class ChatViewController: UICollectionViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white
        
        setUpInput()
        
    }
    
    func setUpInput() {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.white
        view.addSubview(containerView)
        
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: .normal)
        sendButton.addTarget(self, action: #selector(send), for: .touchUpInside)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(sendButton)
        
        sendButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        sendButton.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        containerView.addSubview(inputTextField)
        
        inputTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        inputTextField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        inputTextField.rightAnchor.constraint(equalTo: sendButton.leftAnchor).isActive = true
        inputTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        let seperator = UIView()
        seperator.backgroundColor = UIColor.darkGray
        seperator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(seperator)
        
        seperator.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        seperator.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        seperator.bottomAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        seperator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    let inputTextField: UITextField = {
        let i = UITextField()
        i.placeholder = "Enter message..."
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    @objc func send() {
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
                
            }
        }
        
    }
    
}
