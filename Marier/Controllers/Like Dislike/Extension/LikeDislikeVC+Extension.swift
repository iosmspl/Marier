//
//  LikeDislikeVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 12/05/23.
//

import Foundation
import UIKit
extension LikeSuperLikeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = LikeSuperLikeCollectionView.dequeueReusableCell(withReuseIdentifier: "RecentPassCollectionCell", for: indexPath) as! RecentPassCollectionCell
        if selectedIndex == 0 {
            cell.lblLikeDislike.text = "Recently Active"
            cell.imgViewLikeDislike.image = UIImage(named: "i2")
            
        }else{
            cell.lblLikeDislike.text = "\(5+indexPath.row)h left"
            cell.imgViewLikeDislike.image = UIImage(named: "i4")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: 190)
    }
    
    
}
