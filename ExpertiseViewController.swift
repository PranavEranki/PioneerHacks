//
//  ExpertiseViewController.swift
//  
//
//  Created by Anikait Mundhra on 3/17/18.
//

import UIKit

class ExpertiseViewController: UIViewController {
    
    @IBOutlet weak var ZipCode3: UITextField!
    @IBOutlet weak var ZipCode2: UITextField!
    @IBOutlet weak var ZipCode1: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        func ZipCodeButton(_ sender: UIButton) {

            
            let zip1: String = ZipCode1.text!
            let zip2: String = ZipCode2.text!
            let zip3: String = ZipCode3.text!
            
            if ((zip1.count == 5) && (zip2.count == 5 || zip2.count == 0) && (zip3.count == 5 || zip3.count == 0)) {
                navigationController?.pushViewController(ChatViewController(), animated: true)
            }
        }
        

        // Do any additional setup after loading the view.
    }

    

}
