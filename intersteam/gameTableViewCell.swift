//
//  gameTableViewCell.swift
//  intersteam
//
//  Created by Chris Cook on 7/26/18.
//  Copyright © 2018 destinycreates. All rights reserved.
//

import UIKit

class gameTableViewCell: UITableViewCell {

    
    @IBOutlet weak var gameTitleLabel: UILabel!
    
    @IBOutlet weak var availabilityLabel: UILabel!
    @IBOutlet weak var gameGenreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
