//
//  MyPhotosVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 19/05/23.
//

import Foundation
import UIKit
extension MyPhotosVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MyphotosCollectionView.dequeueReusableCell(withReuseIdentifier: "MyphotosCell", for: indexPath) as! MyphotosCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3 , height: collectionView.frame.height/5)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("||\(indexPath.row)||")
    }
    
}
