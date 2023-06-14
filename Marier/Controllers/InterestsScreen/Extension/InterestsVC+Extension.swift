//
//  InterestsVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 30/03/23.
//

import Foundation
import UIKit
extension InterestsVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interestArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let notSelectedcolor = SetcolorRgb(red: 117, green: 117, blue: 117)
     let Selectedcolor = SetcolorRgb(red: 230, green: 84, blue: 160)

        let cell = interestsCollectionView.dequeueReusableCell(withReuseIdentifier: "InterestsCollectionViewCell", for: indexPath) as! InterestsCollectionViewCell
        cell.lblInterests.text = interestArray[indexPath.item].interest
        if selectedIndexs.isEmpty == false{
            for ele in selectedIndexs{
                let element = Int(ele)
                if element == indexPath.row{
                    cell.lblInterests.textColor = .white
                    cell.ViewInterests.backgroundColor = Selectedcolor
                    return cell
                }
                else{
                    cell.lblInterests.textColor = notSelectedcolor
                    cell.ViewInterests.backgroundColor = .clear
//                    return cell
                }
            }
        }
        cell.lblInterests.textColor = notSelectedcolor
        cell.ViewInterests.backgroundColor = .clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let inde = "\(indexPath.item)"
        if selectedIndexs.contains("\(inde)"){
          let index = (selectedIndexs.firstIndex(of: "\(inde)"))!
            selectedIndexs.remove(at: index)
            interestsCollectionView.reloadData()
        }else{
            selectedIndexs.append(inde)
            interestsCollectionView.reloadData()
        }
        
        
//        selectedIndexs.sort()
//        print("---jjj--\(selectedIndexs)--")
        let objectId:String = (interestArray[indexPath.item]._id)!
        if selectedIntersArr.contains("\(objectId)"){
          let index = (selectedIntersArr.firstIndex(of: "\(objectId)"))!
            selectedIntersArr.remove(at: index)
//            interestsCollectionView.reloadData()
        }else{
            selectedIntersArr.append(objectId)
//            interestsCollectionView.reloadData()
        }
        
    }
}
