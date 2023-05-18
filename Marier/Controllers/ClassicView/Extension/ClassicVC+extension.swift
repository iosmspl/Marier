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
    
    
    func koloda(_ koloda: Koloda.KolodaView, viewForCardAt index: Int) -> UIView {
        let container = containers[index]
        container.img = self .imgArray[index]
        container.restContent()
        return containers[index].view
    }

    func kolodaNumberOfCards(_ koloda: Koloda.KolodaView) -> Int {
//        print(  "this is array \(imgArray.count)")
        return imgArray.count
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "DetailProfileVC") as! DetailProfileVC
        navigationController?.pushViewController(vc, animated: true)
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
//
//    func koloda(_ koloda: KolodaView, targetDirectionForSwipeAt index: Int) -> SwipeResultDirection {
//        return .top
//       }
}





