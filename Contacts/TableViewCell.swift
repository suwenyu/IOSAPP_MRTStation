//
//  TableViewCell.swift
//  Contacts
//
//  Created by WenYu on 2016/5/6.
//  Copyright © 2016年 TsungYen Su. All rights reserved.
//

import UIKit


class TableViewCell: UITableViewCell {

    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var line1Label: UILabel!
    @IBOutlet var line2Label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
