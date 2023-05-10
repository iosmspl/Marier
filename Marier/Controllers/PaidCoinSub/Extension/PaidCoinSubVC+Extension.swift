//
//  PaidCoinSubVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 08/05/23.
//

import Foundation
import UIKit
 
extension PaidCoinSubVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = paidCoinCollect.dequeueReusableCell(withReuseIdentifier: "PaidPlanCollectionCell", for: indexPath) as! PaidPlanCollectionCell
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/2)
    }
    
}
