//
//  ContainerVC.swift
//  Marier
//
//  Created by MacBook M1 on 07/04/23.
//

import UIKit

class ContainerVC: UIViewController {
    @IBOutlet weak var UserImgView: UIImageView!
    
    var img:UIImage?
    var SwipeImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
//        SwipeImageView.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    func restContent() {
        DispatchQueue.main.async {
            self.UserImgView.image = self.img
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
