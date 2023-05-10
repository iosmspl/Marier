//
//  ClassicVC+extension.swift
//  Marier
//
//  Created by MacBook M1 on 07/04/23.
//

import Foundation
import UIKit
import Koloda
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
    
    
}

