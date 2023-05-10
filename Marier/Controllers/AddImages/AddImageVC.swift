//
//  AddImageVC.swift
//  Marier
//
//  Created by MacBook M1 on 30/03/23.
//

import UIKit

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
        
        let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "TabBarVc") as! TabBarVc
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
