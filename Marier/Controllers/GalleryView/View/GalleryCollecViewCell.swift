//
//  GalleryCollecViewCell.swift
//  Marier
//
//  Created by MacBook M1 on 05/04/23.
//

import UIKit

class GalleryCollecViewCell: UICollectionViewCell {
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var ShadowView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
