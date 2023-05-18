//
//  DetailProfileVC.swift
//  Marier
//
//  Created by MacBook M1 on 07/04/23.
//

import UIKit

class DetailProfileVC: UIViewController {
    
    var menuClicked = false
    @IBOutlet weak var MenuView: UIView!
    @IBOutlet weak var DetailCollection: UICollectionView!
    
    @IBOutlet weak var StarBtn: UIButton!
    @IBOutlet weak var LikeBtn: UIButton!
    @IBOutlet weak var DislikeBtn: UIButton!
    let imgArrayTemp = [UIImage(named: "i1"),UIImage(named: "i2")
                  ,UIImage(named: "i3"),UIImage(named: "i4"),
                    UIImage(named: "i5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuView.isHidden = true
        let arrayBtn:[UIButton] = [StarBtn,LikeBtn,DislikeBtn]
        for btn in arrayBtn{
            btn.layer.cornerRadius = 25
            btn.layer.masksToBounds = false
            btn.layer.shadowColor = UIColor.black.cgColor
            btn.layer.shadowOffset = CGSize(width: 0, height: 2)
            btn.layer.shadowRadius = 2
            btn.layer.shadowOpacity = 0.5
            
        }
        
        DetailCollection.register(UINib(nibName: "DetailProfileCollectionCell", bundle: nil), forCellWithReuseIdentifier: "DetailProfileCollectionCell") 
        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackTapped(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
     
    @IBAction  func menuTapped(_ sender: UIButton){
//        if menuClicked == false{
//            MenuView.isHidden = false
//            menuClicked = true
//        }else{
//            MenuView.isHidden = true
//            menuClicked = false
//        }
        let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "ShareVC") as! ShareVC
               self.present(vc, animated: true)

        
    }
    
    @IBAction func ShareTapped(_ sender: UIButton) {
//        let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "ShareVC") as! ShareVC
//               self.present(vc, animated: true)
    }
    
    @IBAction func ReportTapped(_ sender: UIButton) {
//        let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "ReportVC") as! ReportVC
//               self.present(vc, animated: true)
    }
    
    
    
}
