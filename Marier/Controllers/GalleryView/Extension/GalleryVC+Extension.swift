//
//  GalleryVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 06/04/23.
//

import Foundation
import UIKit
import AlamofireImage
extension GalleryVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Defaults.defaultClass.galleryViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let GalleryCell = GalleryCollectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollecViewCell", for: indexPath) as! GalleryCollecViewCell
//        GalleryCell.UserImage.image = UIImage(named: "i4")
        print("\(indexPath.item)")
        let imageurl = Defaults.defaultClass.galleryViewData[indexPath.item].avatar ?? ""
        let name = Defaults.defaultClass.galleryViewData[indexPath.item].name ?? ""
        GalleryCell.userName.text = name
        GalleryCell.UserImage.image = nil
        GalleryCell.UserImage.af.setImage(withURL: URL(string: imageurl)!)
        GalleryCell.ShadowView.layer.shadowOpacity = 0.5
        GalleryCell.ShadowView.layer.shadowColor = UIColor.black.cgColor
        GalleryCell.ShadowView.layer.shadowRadius = 2
        
        // code for shadow effect
        GalleryCell.ShadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
        return GalleryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return   CGSize(width: collectionView.frame.width/2 , height: 200 )
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let id:String = (Defaults.defaultClass.galleryViewData[indexPath.item]._id) ?? ""
        
        print("\(id)")
        let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "DetailProfileVC") as! DetailProfileVC
        ApiManger.Shared.getCurrentUserApi(id: id) { resdata, isSuccess in
            if isSuccess {
                vc.nameUser = (resdata?.data?.name) ?? ""
                vc.genderUser = (resdata?.data?.sex) ?? ""
                vc.bioUser = (resdata?.data?.bio) ?? ""
                vc.interestsUser = (resdata?.data?.interests) ?? [GetallInterData]()
                vc.avatar = (resdata?.data?.avatar) ?? ""
                vc.galleryUser = (resdata?.data?.gallery) ?? [Gallery]()
                vc.location = (resdata?.data?.setting?.location?.coordinates) ?? []
                self.navigationController?.pushViewController(vc, animated: true)
            }else {
                print("failure")
            }
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bottomEdge = scrollView.contentOffset.y+scrollView.frame.size.height
//        print("bottom edge\(bottomEdge) == contentoffset.y \(scrollView.contentOffset.y) = frame size \(scrollView.frame.size.height) = contentsize \(scrollView.contentSize.height)" )
        if bottomEdge >= (scrollView.contentSize.height-200) && !isFeatchedData{
            isFeatchedData = true
            ApiManger.Shared.getAlluserApi(pageSize: 10, pageNo: Defaults.defaultClass.galleryViewPageNo!+1) { resdata, isSuccess in
                if isSuccess{
                    print("galleryViewData before fetching: \(Defaults.defaultClass.galleryViewData.count)")
                    let countBefore:Int = Defaults.defaultClass.galleryViewData.count
                    Defaults.defaultClass.galleryViewData.append(contentsOf: resdata?.data ?? [])
                    let countAfter:Int = Defaults.defaultClass.galleryViewData.count
                    if countBefore != countAfter {
                        Defaults.defaultClass.galleryViewPageNo = Defaults.defaultClass.galleryViewPageNo!+1
                    }
                    
                    print("galleryViewData after fetching: \(Defaults.defaultClass.galleryViewData.count)")

//                    print("gallery ext galleery data = \(Defaults.defaultClass.galleryViewData.count)")
                    
                    self.GalleryCollectionView.reloadData()
                }else{
                    print("somthing wrong = gallery extension")
                }
                self.isFeatchedData = false
            }
        }
    }
    
    
    
    
    
}
