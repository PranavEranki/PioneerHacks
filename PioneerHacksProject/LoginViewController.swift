//
//  ViewController.swift
//  PioneerHacksProject
//
//  Created by Mehul Tailang on 3/14/18.
//  Copyright © 2018 Mehul Tailang. All rights reserved.
//

import UIKit
import FirebaseAuth
import CoreLocation

class LoginViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.requestAlwaysAuthorization()
        
        //locationManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (user, err) in
            if err != nil {
                print(err!)
            }
            else {
                //let vc = ChatViewController()
                //self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}

