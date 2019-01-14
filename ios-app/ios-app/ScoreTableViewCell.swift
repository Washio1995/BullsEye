//
//  ScoreTableViewCell.swift
//  ios-app
//
//  Created by PRADOPC on 12/18/18.
//  Copyright © 2018 PRADOPC. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
