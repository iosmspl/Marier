//
//  SettingsVC.swift
//  Marier
//
//  Created by MacBook M1 on 05/05/23.
//

import UIKit

class SettingsVC: UIViewController {
    @IBOutlet weak var edit_Btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        edit_Btn.layer.shadowColor = UIColor.black.cgColor
        edit_Btn.layer.shadowOpacity = 0.5
        edit_Btn.layer.shadowOffset = CGSize(width: 0, height: 2)
        edit_Btn.layer.shadowRadius = 2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTapped(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    @IBAction func editProfileTapped(_ sender: UIButton){
        let vc  = StoryBoards.Profile.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func PrivacyTapped(_ sender: UIButton) {
        let vc = StoryBoards.Profile.instantiateViewController(withIdentifier: "PrivacyVC") as! PrivacyVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func LanguageTapped(_ sender: UIButton) {
        let vc = StoryBoards.Profile.instantiateViewController(withIdentifier: "AppLangVC") as! AppLangVC
        present(vc, animated: true)
    }
    @IBAction func FaqsTapped(_ sender: UIButton) {
        let vc = StoryBoards.Profile.instantiateViewController(withIdentifier: "FaqsVC") as! FaqsVC
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func RecetPassesTapped(_ sender: UIButton) {
        let vc = StoryBoards.Profile.instantiateViewController(withIdentifier: "RecentPassesVC") as! RecentPassesVC
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func ReferAsFriendTapped(_ sender: UIButton) {
        let vc = StoryBoards.Profile.instantiateViewController(withIdentifier: "ReferAsFriendVC") as! ReferAsFriendVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ManageNotificationTapped(_ sender: UIButton) {
        let vc = StoryBoards.Profile.instantiateViewController(withIdentifier: "MangenotifiactionVC") as! MangenotifiactionVC
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func ContactSupportTapped(_ sender: UIButton) {
        let vc = StoryBoards.Profile.instantiateViewController(withIdentifier: "RequestHelpVC") as! RequestHelpVC
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func LogoutTapped(_ sender: UIButton) {
        let vc = StoryBoards.Profile.instantiateViewController(withIdentifier: "LogoutVC") as! LogoutVC
        present(vc, animated: true)
    }
    @IBAction func DeleteAccountTapped(_ sender: UIButton) {
        let vc = StoryBoards.Profile.instantiateViewController(withIdentifier: "DeleteAccVC") as! DeleteAccVC
        present(vc, animated: true)
    }
    @IBAction func PremiunSubTapped(_ sender: UIButton) {
        let vc = StoryBoards.PaidPlan.instantiateViewController(withIdentifier: "PaidPremiumVC") as! PaidPremiumVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    

@IBAction func EditloctionTapped(_ sender: UIButton) {
    let vc = StoryBoards.Profile.instantiateViewController(withIdentifier: "MapVC") as! MapVC
    navigationController?.pushViewController(vc, animated: true)
}
    @IBAction func MyPhotosTapped(_ sender: UIButton) {
        let vc = StoryBoards.Profile.instantiateViewController(withIdentifier: "MyPhotosVC") as! MyPhotosVC
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
