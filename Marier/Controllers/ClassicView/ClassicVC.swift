//
//  ClassicVC.swift
//  Marier
//
//  Created by MacBook M1 on 06/04/23.
//

import UIKit
import Koloda
class ClassicVC: UIViewController{
    @IBOutlet weak var DislikeImg: UIImageView!
    @IBOutlet weak var LikeImg: UIImageView!
    @IBOutlet weak var SuperLimg: UIImageView!
    
    @IBOutlet  var vu_koloda: KolodaView!
    let imgArray = [UIImage(named: "i1"),UIImage(named: "i2")
                  ,UIImage(named: "i3"),UIImage(named: "i4"),
                    UIImage(named: "i5")]
    var containers = [ContainerVC]()
//    var img: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadContainerViews()
        let SwipeImgArray:[UIImageView] = [DislikeImg,LikeImg,SuperLimg]
        for img in SwipeImgArray{
            img.isHidden = true
        }
        vu_koloda.delegate = self
        vu_koloda.dataSource = self
        // Do any additional setup after loading the view.
        
        vu_koloda.reloadData()
    }
    
    func loadContainerViews(){
        for _ in 0...imgArray.count-1{
            let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "ContainerVC") as! ContainerVC
            self.addChild(vc)
            self.containers.append(vc)
        }
    }

    @IBAction func dislikeTapped(_ sender: UIButton) {
        vu_koloda.swipe(.left)
        SwipeImageMethod(like: true, dislike: false, superlike: true)
    }
    
    @IBAction func likedTapped(_ sender: Any) {
        vu_koloda.swipe(.right)
        SwipeImageMethod(like: false, dislike: true, superlike: true)
        
    }
    
    @IBAction func reverseTapped(_ sender: Any) {
        vu_koloda.revertAction()
    }
    
    
    @IBAction func FilterTapped(_ sender: Any) {
        let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func StarTapped(_ sender: UIButton) {
//        let VC = StoryBoards.Discover.instantiateViewController(withIdentifier: "MatchedVC") as! MatchedVC
//        present(VC, animated: true)
        vu_koloda.swipe(.up)
        SwipeImageMethod(like: true, dislike: true, superlike: false)
    }
    
    
}
