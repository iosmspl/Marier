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

    override func viewDidLoad() {
        super.viewDidLoad()
        interestsCollectionView.register(UINib(nibName: "InterestsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InterestsCollectionViewCell")
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SubmitTapped(_ sender: UIButton){
        let vc = StoryBoards.auth.instantiateViewController(withIdentifier: "AddImageVC") as! AddImageVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
