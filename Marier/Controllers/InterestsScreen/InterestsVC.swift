//
//  InterestsVC.swift
//  Marier
//
//  Created by MacBook M1 on 30/03/23.
//

import UIKit

class InterestsVC: UIViewController{
    
    @IBOutlet weak var interestsCollectionView: UICollectionView!
    let arr1 = ["Weightlifting","Potterhead","Dancing","politics","Vinyasa","Sailing"]
    var  interestArray = [GetallInterData]()
    var selectedIntersArr = [String]()
    var selectedIndexs = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        interestsCollectionView.register(UINib(nibName: "InterestsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InterestsCollectionViewCell")
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SubmitTapped(_ sender: UIButton){

        if selectedIndexs.isEmpty{
            AlertDisplay(AlertTitle: "Please Select at least one interest", Message: "", Actiontitle: "OK")
        }else{
            
        }

                
                 
//        let vc = StoryBoards.auth.instantiateViewController(withIdentifier: "AddImageVC") as! AddImageVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBAction func backTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
