//
//  MyprofileVC.swift
//  Marier
//
//  Created by MacBook M1 on 04/05/23.
//

import UIKit
import PhotosUI
import AlamofireImage
class MyprofileVC: UIViewController {
    @IBOutlet weak var UserProfilePic: UIImageView!
    @IBOutlet weak var MyprofileCollectionView: UICollectionView!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblFrom: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBio: UILabel!

    var Selected_img_Array = [UIImage]()
    var interestsArray = [GetallInterData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        MyprofileCollectionView.register(UINib(nibName: "MyprofileCollectionCell", bundle: nil), forCellWithReuseIdentifier: "MyprofileCollectionCell")
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        let id = Defaults.defaultClass.id
        ApiManger.Shared.getCurrentUserApi(id: id) {[self] resdata, isSuccess in
            if isSuccess {
                interestsArray = (resdata?.data?.interests)!
                let gender: String = (resdata?.data?.sex) ?? ""
//                let from: String = (resdata?.data?.loc) ?? ""
                let name: String = (resdata?.data?.name) ?? ""
                let bio: String = (resdata?.data?.bio) ?? ""
//                print("\(gender)-\(from)-\(name)-\(bio)")
                lblGender.text = gender
                lblFrom.text = Defaults.defaultClass.loc
                lblName.text = name
                lblBio.text = bio
                MyprofileCollectionView.reloadData()
                
                if let img:String = (resdata?.data?.avatar) {
                    print("---\(img)---")
                    UserProfilePic.af.setImage(withURL: (URL(string: img))!)
                }
                
            }
        }
        
       
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
            config.selectionLimit = 1
            
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
