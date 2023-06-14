//
//  ClassicVC+extension.swift
//  Marier
//
//  Created by MacBook M1 on 07/04/23.
//

import Foundation
import UIKit
import Koloda


extension ClassicVC{
    func SwipeImageMethod(like: Bool,dislike: Bool,superlike: Bool) {
        DislikeImg.isHidden = dislike
        LikeImg.isHidden = like
        SuperLimg.isHidden = superlike
            DispatchQueue.main.asyncAfter(deadline: .now()+0.1 ){ [self] in
                DislikeImg.isHidden = true
                LikeImg.isHidden = true
                SuperLimg.isHidden = true
            }
    }
}



extension ClassicVC:KolodaViewDelegate,KolodaViewDataSource{
     
    func koloda(_ koloda: KolodaView, didShowCardAt index: Int) {
        
        if index == Defaults.defaultClass.userdataApi.count-3 {
            ApiManger.Shared.getAlluserApi(pageSize: self.pageSize, pageNo: Defaults.defaultClass.pageNo!+1) {[self] resdata,isSuccess in
                
                       if isSuccess {
                           Defaults.defaultClass.pageNo! += 1
                           let array = (resdata?.data)!
                           print("-\(array.count)")
//                           userdata.append(contentsOf: array)
                           print("=**\(Defaults.defaultClass.userdataApi.count)==")
                           Defaults.defaultClass.userdataApi.append(contentsOf: array)
                           print("=**\(Defaults.defaultClass.userdataApi.count)==")

//                           for arr in array{
//                               let avatar:String = "\((arr.avatar) ?? "")"
//                               print("avatar = \(avatar)==")
//                               usersData.append(avatar)
//                           }
                           loadContainerViews()
                           vu_koloda.reloadData()
                       }
           
                   }
        }
    }
//    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
//        ApiManger.Shared.getAlluserApi(pageSize: 10, pageNo: 2) {[self] resdata,isSuccess in
//                   if isSuccess {
//                       let array = (resdata?.data)!
//                       
//                      
//                       for arr in array{
//                           let avatar:String = "\((arr.avatar) ?? "")"
//                           print("avatar = \(avatar)==")
//                           usersData.append(avatar)
//                       }
//                       loadContainerViews()
//                       vu_koloda.reloadData()
//                   }
//       
//               }
//    }
    
    func koloda(_ koloda: Koloda.KolodaView, viewForCardAt index: Int) -> UIView {
        print("--\(containers.count)--")
        print("index\(index)")

        let container = containers[index]
//        container.img = self .imgArray[index]
//        container.image = self .usersData[index]
     let alluserData =  Defaults.defaultClass.userdataApi
//        container.nameStr = self .userdata[index].name
        container.nameStr = alluserData[index].name
//        container.bioStr = self .userdata[index].bio
        container.bioStr = alluserData[index].bio
//        container.image = self.userdata[index].avatar
        container.image = alluserData[index].avatar
        container.restContent()
        return containers[index].view
    }

    func kolodaNumberOfCards(_ koloda: Koloda.KolodaView) -> Int {
//        print(  "this is array \(imgArray.count)")
//        return imgArray.count]
        return Defaults.defaultClass.userdataApi.count
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        
//        print("--\(index)")
        let id = Defaults.defaultClass.userdataApi[index]._id
//        let id = "64788fe7637e0a85082d76d0"
        print("\(id)")
        let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "DetailProfileVC") as! DetailProfileVC
        ApiManger.Shared.getCurrentUserApi(id: id!) { resdata, isSuccess in
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
    func koloda(_ koloda: KolodaView, draggedCardWithPercentage finishPercentage: CGFloat, in direction: SwipeResultDirection) {
       
        switch direction {
        case .left: print("l")
            if finishPercentage == CGFloat(100)  {
                SwipeImageMethod(like: true, dislike: false, superlike: true)
            }
//            else{
//                DislikeImg.isHidden = true
//            }
           
        case .right: print("r")
            if finishPercentage == CGFloat(100)  {
                SwipeImageMethod(like: false, dislike: true, superlike: true)
            }
        case .up: print("u")
            if finishPercentage == CGFloat(100)  {
                SwipeImageMethod(like: true, dislike: true, superlike: false)
            }
        default: print("")
        }
    }
    

    
    
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.left,.right,.up]
    }
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        print("@@ind\(index) $ \(koloda.currentCardIndex)!")
        let likeTo:String = Defaults.defaultClass.userdataApi[index]._id ?? ""
       print("--\(likeTo)")
        if index != koloda.currentCardIndex && direction == .left{
//            print("@@ind\(index) $ \(koloda.currentCardIndex)!")
            ApiManger.Shared.createDislikesApi(dislikeTo: likeTo) {
                print("compilation")
            }
            print("card removed to left")
            
        }else if index != koloda.currentCardIndex && direction == .right{
//            let likeTo:String = Defaults.defaultClass.userdataApi[index]._id ?? ""
            print("like to \(likeTo)")
            ApiManger.Shared.createLikesApi(likeTo: likeTo, isLiked: true) {
                print("compilation")
            }
            print("card removed to right")
        }else if index != koloda.currentCardIndex && direction == .up{
            ApiManger.Shared.createSuperLikesApi(likeTo: likeTo, isSuperLike: true) {
                print("compilation")
            }
            
            print("card removed in upward direction")
        }
    }
//
//    func koloda(_ koloda: KolodaView, targetDirectionForSwipeAt index: Int) -> SwipeResultDirection {
//        return .top
//       }
}





