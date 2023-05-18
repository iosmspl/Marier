//
//  MyprofileVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 04/05/23.
//

import Foundation
import UIKit
import PhotosUI

extension MyprofileVC: PHPickerViewControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
       
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { Object , error in
                if let image = Object as? UIImage{
                    self.Selected_img_Array.append(image)
                    print("img array ||\(self.Selected_img_Array)||")

                }
                
            }
        }
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage{
            self.Selected_img_Array.append(image)
            print("img array ||\(Selected_img_Array)||")

        } else if let image = info[.originalImage] as? UIImage{
            self.Selected_img_Array.append(image)
            print("img array ||\(Selected_img_Array)||")

        }
//        print("img array ||\(Selected_img_Array)||")

        dismiss(animated: true)
            
    }
    
    
}


extension MyprofileVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MyprofileCollectionView.dequeueReusableCell(withReuseIdentifier: "MyprofileCollectionCell", for: indexPath) as! MyprofileCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3 , height: 55)
    }
    
    
}
