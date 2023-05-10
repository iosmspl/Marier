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
