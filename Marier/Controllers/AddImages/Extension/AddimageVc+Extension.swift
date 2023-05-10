//
//  AddimageVc+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 04/04/23.
//

import Foundation
import UIKit
import PhotosUI

@available(iOS 14.0, *)
extension AddImageVC: PHPickerViewControllerDelegate,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//         if #available(iOS 14.0, *) {
             var config = PHPickerConfiguration()
             config.selectionLimit = imgCount
 //            configu = config
        
             let phpickerController = PHPickerViewController(configuration: config )
             phpickerController.delegate = self
        
             self.present(phpickerController, animated: true)
//         } else {
             // Fallback on earlier versions
//             print("iphone version error")
//         }
 
 
     }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
       // var index =  0                      // it is for imgArray indexing when user clicked again
        for result in results{
//            print(results)
            result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                if let image = object as? UIImage{
                    self.imgArray.append(image)
//                    print(image)
                }
                
                DispatchQueue.main.async {
                    self.AddImgCollection.reloadData()
                }
            }

        }
//       print("this is array img \(imgArray)")
    }
    


}


@available(iOS 14.0, *)
extension AddImageVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(imgArray.count)
//        print(imgArray)
        if imgArray.count > 0 {
            return imgArray.count
        }else{
            return 4
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photcell = AddImgCollection.dequeueReusableCell(withReuseIdentifier: "AddImgCollectionCell", for: indexPath) as! AddImgCollectionCell
        if imgArray.count != 0{
            photcell.userimg.image = imgArray[indexPath.row]
            return photcell
        }
        else{
            
            return photcell
        }
    }
    
    
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/2)
    }
    
    
   
    
}



