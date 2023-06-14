//
//  ContainerVC.swift
//  Marier
//
//  Created by MacBook M1 on 07/04/23.
//

import UIKit
import AlamofireImage
class ContainerVC: UIViewController {
    @IBOutlet weak var UserImgView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var bio: UILabel!
//    @IBOutlet weak var name: UILabel!

    var image: String?
    var nameStr: String?
    var bioStr: String?
    var img:UIImage?
    var SwipeImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
//        SwipeImageView.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    func restContent() {
        DispatchQueue.main.async {
//            self.UserImgView.image = self.img
            self.name.text = self.nameStr ?? "user"
            self.bio.text = self.bioStr ?? "this is bio"
            self.UserImgView.af.setImage(withURL: URL(string: self.image!)!)
        }
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
