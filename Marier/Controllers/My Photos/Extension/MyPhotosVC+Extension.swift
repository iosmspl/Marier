//
//  MyPhotosVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 19/05/23.
//

import Foundation
import UIKit
import AlamofireImage
extension MyPhotosVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myphotsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MyphotosCollectionView.dequeueReusableCell(withReuseIdentifier: "MyphotosCell", for: indexPath) as! MyphotosCell
        
        let img:String = myphotsArray[indexPath.item].image!
        cell.UplodedPics.image = nil
        cell.UplodedPics.af.setImage(withURL: URL(string: img)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3 , height: collectionView.frame.height/5)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let id:String = (Defaults.defaultClass.userdataApi[indexPath.item]._id) ?? ""
        
        
    }
    
}
