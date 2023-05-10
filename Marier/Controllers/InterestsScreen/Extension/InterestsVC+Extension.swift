//
//  InterestsVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 30/03/23.
//

import Foundation
import UIKit
extension InterestsVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = interestsCollectionView.dequeueReusableCell(withReuseIdentifier: "InterestsCollectionViewCell", for: indexPath) as! InterestsCollectionViewCell
        cell.lblInterests.text = arr1[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3.3, height: collectionView.frame.height/2.3)
    }
}
