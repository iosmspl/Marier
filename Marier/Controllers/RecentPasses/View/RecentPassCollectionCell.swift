//
//  RecentPassCollectionCell.swift
//  Marier
//
//  Created by MacBook M1 on 10/05/23.
//

import UIKit

class RecentPassCollectionCell: UICollectionViewCell {
    @IBOutlet weak var lblLikeDislike: UILabel!
    @IBOutlet weak var ViewBack: UIView!
    @IBOutlet weak var imgViewLikeDislike: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        ViewBack.layer.shadowColor = UIColor.black.cgColor
        ViewBack.layer.shadowOpacity = 0.5
        ViewBack.layer.shadowRadius = 2
        ViewBack.layer.shadowOffset = CGSize(width: 0, height: 2)
        // Initialization code
    }

}
