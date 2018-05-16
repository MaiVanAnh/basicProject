//
//  MyCell.swift
//  PasswordKeeper1.1
//
//  Created by Van Anh on 5/16/18.
//  Copyright © 2018 Van Anh. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet var nameapp: UILabel!
    
    @IBOutlet var username: UILabel!
    
    @IBOutlet var password: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        nameapp.adjustsFontForContentSizeCategory = true
        username.adjustsFontForContentSizeCategory = true
        password.adjustsFontForContentSizeCategory = true
    }


}
