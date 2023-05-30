//
//  AddImageVC.swift
//  Marier
//
//  Created by MacBook M1 on 30/03/23.
//

import UIKit
import Alamofire
import ARSLineProgress
class AddImageVC: UIViewController {
    @IBOutlet weak var AddImgCollection: UICollectionView!
    var imgArray = [UIImage]()
    var configu: Any?
    var imgCount = 4
    override func viewDidLoad() {
        super.viewDidLoad()
        AddImgCollection.register(UINib(nibName: "AddImgCollectionCell", bundle: nil),forCellWithReuseIdentifier: "AddImgCollectionCell")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTapped(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submitTapped(_ sender: UIButton) {
//        print("===\(imgArray)==")
       
        
        if imgArray.isEmpty{
            AlertDisplay(AlertTitle: "Please Select at least one image", Message: "", Actiontitle: "OK")
        }else{
            ARSLineProgress.show()
            ApiManger.Shared.uploadImagesApi(images: imgArray) { isSucces, error in
                print("Complilation")
                if isSucces{
                    ARSLineProgress.hide()
                    let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "TabBarVc") as! TabBarVc
                           self.navigationController?.pushViewController(vc, animated: true)
                }else{
                    ARSLineProgress.hide()
                    self.AlertDisplay(AlertTitle: "Somthing Went Wrong ", Message: "", Actiontitle: "OK")
                }
                
            }
        }
//        let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "TabBarVc") as! TabBarVc
//        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
