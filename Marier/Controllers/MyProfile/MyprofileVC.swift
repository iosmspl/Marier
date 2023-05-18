//
//  MyprofileVC.swift
//  Marier
//
//  Created by MacBook M1 on 04/05/23.
//

import UIKit
import PhotosUI

class MyprofileVC: UIViewController {
    @IBOutlet weak var UserProfilePic: UIImageView!
    @IBOutlet weak var MyprofileCollectionView: UICollectionView!
    var Selected_img_Array = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        MyprofileCollectionView.register(UINib(nibName: "MyprofileCollectionCell", bundle: nil), forCellWithReuseIdentifier: "MyprofileCollectionCell")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CameraIconTapped(_ sender: UIButton) {
        let Alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        let TakePhoto = UIAlertAction(title: "Take Photo", style: .default) {[self] TakePhoto in
            
            let Picker = UIImagePickerController()
            Picker.delegate = self
            Picker.sourceType = .camera
            Picker.allowsEditing = true
            present(Picker, animated: true)
            
//            DispatchQueue.main.asyncAfter(deadline: .now()+5){
//                print(" image array ||\(Selected_img_Array)|| ")
//            }
        }
        let Gallery = UIAlertAction(title: "Chose From Gallery", style: .default) {[self] Gallery in
            
            var config = PHPickerConfiguration()
            config.selectionLimit = 4
            
            let ImagePicker = PHPickerViewController(configuration: config)
            ImagePicker.delegate = self
             
            present(ImagePicker, animated: true)
//            DispatchQueue.main.asyncAfter(deadline: .now()+5){
//                print(" image array ||\(Selected_img_Array)|| ")
//            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        Alert.addAction(TakePhoto)
        Alert.addAction(Gallery)
        Alert.addAction(cancel)
        present(Alert, animated: true)
        
        
        
        
    }
    @IBAction func settingTapped(_ sender: UIButton){
        let vc  = StoryBoards.Profile.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
//        let vc  = StoryBoards.Profile.instantiateViewController(withIdentifier: "MyprofilePaidVC") as! MyprofilePaidVC
        navigationController?.pushViewController(vc, animated: true)
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
