//
//  RecentPasssesVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 10/05/23.
//

import Foundation
import UIKit

extension RecentPassesVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = RecentPassCollectionView.dequeueReusableCell(withReuseIdentifier: "RecentPassCollectionCell", for: indexPath) as! RecentPassCollectionCell
        
        if selectedIndex == 0{
            cell.imgViewLikeDislike.image = UIImage(named: "i5")
            cell.lblLikeDislike.text = "Recently liked"
        }else{
            cell.imgViewLikeDislike.image = UIImage(named: "i2")
            cell.lblLikeDislike.text = "Recently Disliked"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: 190
        )
    }
    
    
}
