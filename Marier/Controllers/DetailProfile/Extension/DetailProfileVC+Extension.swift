//
//  DetailProfileVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 10/04/23.
//

import Foundation
import UIKit



// collection  for detail profile
    // MARK:- Detailvc collection
extension DetailProfileVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        print("this is the image count detail \(imgArrayTemp.count)")
        return imgArrayTemp.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = DetailCollection.dequeueReusableCell(withReuseIdentifier: "DetailProfileCollectionCell", for: indexPath) as! DetailProfileCollectionCell
        cell.moreImg.image = imgArrayTemp[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 150
        )
    }
    
    
    
}


