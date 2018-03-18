//
//  CustomCell.swift
//  
//
//  Created by Anikait Mundhra on 3/17/18.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var messageBackground: UIView!
    @IBOutlet weak var senderName: UILabel!
    @IBOutlet weak var messageBody: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code hi
    }


    
}
