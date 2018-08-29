//
//  ListTableViewCell.swift
//  FirebasePractice
//
//  Created by 市川龍星 on 2018/08/29.
//  Copyright © 2018年 市川龍星. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
