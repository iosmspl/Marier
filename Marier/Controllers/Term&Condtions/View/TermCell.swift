//
//  TermCell.swift
//  Marier
//
//  Created by MacBook M1 on 17/05/23.
//

import UIKit

class TermCell: UITableViewCell {

    @IBOutlet weak var lblContentHeading: UILabel!
    @IBOutlet weak var ContentDescp: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
