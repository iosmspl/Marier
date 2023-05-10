//
//  LandingVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 23/03/23.
//

import Foundation
import UIKit

extension LandingVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
//
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LandingCollectionCell", for: indexPath) as! LandingCollectionCell
        screenTitle.text = titleArray[indexPath.item]
        screenDiscription.text = descriptionArray[indexPath.item]
        cell.cellImage.image = UIImage(named: landingImg[indexPath.row])
        if indexPath.row == 2{
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 3.0){
                let vc = StoryBoards.auth.instantiateViewController(withIdentifier: "EmailVC") as! EmailVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        // Configure the cell
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(self.view.frame.height)
        return CGSize(width: landingColl.frame.width, height: landingColl.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.section
        
       
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
          let width = scrollView.frame.width
          let horizontalCenter = width / 2

          pageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
      
    }
}

