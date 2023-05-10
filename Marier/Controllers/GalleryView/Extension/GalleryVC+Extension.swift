//
//  GalleryVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 06/04/23.
//

import Foundation
import UIKit

extension GalleryVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let GalleryCell = GalleryCollectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollecViewCell", for: indexPath) as! GalleryCollecViewCell
        GalleryCell.UserImage.image = UIImage(named: "i4")
        
        GalleryCell.ShadowView.layer.shadowOpacity = 0.8
        GalleryCell.ShadowView.layer.shadowColor = UIColor.white.cgColor
        GalleryCell.ShadowView.layer.shadowRadius = 2
        
        // code for shadow effect
//        GalleryCell.ShadowView.layer.shadowOffset = CGSize(width: 5, height: 5)
        return GalleryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return   CGSize(width: collectionView.frame.width/2 , height: 200 )
        
        
    }
    
    
    
    
    
}
