//
//  TermsConditionVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 30/03/23.
//

import UIKit

extension TermsConditionVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TermsCell", for: indexPath) as! TermsCell
        
        cell.title.text = titleArray[indexPath.item]
        cell.descriptionT.text = descriptionArray[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/2)
    }
    
}
