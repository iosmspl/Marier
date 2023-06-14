//
//  LikeDislikeVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 12/05/23.
//

import Foundation
import UIKit
import AlamofireImage
extension LikeSuperLikeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       if(selectedIndex == 0){
           return likedbyUserArray.count
       }else{
           return dislikeUsersArray.count
       }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = LikeSuperLikeCollectionView.dequeueReusableCell(withReuseIdentifier: "RecentPassCollectionCell", for: indexPath) as! RecentPassCollectionCell
        if selectedIndex == 0 {
            cell.lblLikeDislike.text = "Recently Active"
//            cell.imgViewLikeDislike.image = UIImage(named: "i2")
            let imgUrl:String = likedbyUserArray[indexPath.item].likeBy?.avatar ?? ""
            cell.imgViewLikeDislike.image = nil
            cell.imgViewLikeDislike.af.setImage(withURL: URL(string: imgUrl)!)
            
        }else{
            cell.lblLikeDislike.text = "Recently Active"
            cell.imgViewLikeDislike.image = nil
            let imgurl: String = dislikeUsersArray[indexPath.item].dislikeBy?.avatar ?? ""
            cell.imgViewLikeDislike.af.setImage(withURL: URL(string: imgurl)!)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: 190)
    }
    
    
}
extension LikeSuperLikeVC: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bottomEdge = scrollView.contentOffset.y+scrollView.frame.size.height
        
        if bottomEdge <= (scrollView.contentSize.height-200) && !isFetched && selectedIndex == 1{
            isFetched = true
        
            ApiManger.Shared.getAlldislikes(pageNo:Defaults.defaultClass.dislikePageNo!+1 , pageSize: 10) { [self] resdata, isSuccess in
                if isSuccess{
                    let countBefore = dislikeUsersArray.count
                    dislikeUsersArray.append(contentsOf: resdata?.data ?? [] )
                    let countAfter = dislikeUsersArray.count
                    if countBefore != countAfter {
                        Defaults.defaultClass.dislikePageNo = Defaults.defaultClass.dislikePageNo!+1
                    }
                    LikeSuperLikeCollectionView.reloadData()
                }
            }
        }
    }
}
