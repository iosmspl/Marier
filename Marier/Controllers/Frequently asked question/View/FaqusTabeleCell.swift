//
//  FaqusTabeleCell.swift
//  Marier
//
//  Created by MacBook M1 on 10/05/23.
//

import UIKit

class FaqusTabeleCell: UITableViewCell {
    @IBOutlet weak var lblQues: UILabel!
    @IBOutlet weak var lblAns: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
