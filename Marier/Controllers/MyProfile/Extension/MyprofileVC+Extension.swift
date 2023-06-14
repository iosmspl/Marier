//
//  MyprofileVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 04/05/23.
//

import Foundation
import UIKit
import PhotosUI
import ARSLineProgress
extension MyprofileVC: PHPickerViewControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
       
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { Object , error in
                if let image = Object as? UIImage{
                    self.Selected_img_Array.append(image)
//                    self.UserProfilePic.image = image
                    print("img array ||\(self.Selected_img_Array)||")
                    
                    ApiManger.Shared.profileImageUpload(image: image) { isSuccess in
                        if isSuccess{
                            print("sucees")
                        }else{
                            print("somthing wrong===")
                        }
                    }

                }
                
            }
        }
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage{
//            ARSLineProgress.show()
//            self.UserProfilePic.image = image

            self.Selected_img_Array.append(image)
            print("img array ||\(Selected_img_Array)||")
            ApiManger.Shared.profileImageUpload(image: image) { isSuccess in
//                ARSLineProgress.hide()
                if isSuccess{
                    
                    print("sucees")
                }else{
                    print("somthing wrong===")
                }
            }
        } else if let image = info[.originalImage] as? UIImage{
            self.Selected_img_Array.append(image)
//            ARSLineProgress.show()
            self.UserProfilePic.image = image

            print("img array ||\(Selected_img_Array)||")
            ApiManger.Shared.profileImageUpload(image: image) { isSuccess in
//                ARSLineProgress.hide()
                if isSuccess{
                    print("sucees")
                }else{
                    print("somthing wrong===")
                }
            }
        }
        
//        print("img array ||\(Selected_img_Array)||")
         
        dismiss(animated: true)
            
    }
    
    
}


extension MyprofileVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        interestsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MyprofileCollectionView.dequeueReusableCell(withReuseIdentifier: "MyprofileCollectionCell", for: indexPath) as! MyprofileCollectionCell
        cell.lblInterests.text = (interestsArray[indexPath.item].interest)!
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3 , height: 55)
    }
    
    
}
