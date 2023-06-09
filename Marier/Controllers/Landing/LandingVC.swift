//
//  LandingVC.swift
//  Marier
//
//  Created by MacBook M1 on 22/03/23.
//

import UIKit

class LandingVC: UIViewController {

    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var collectionView: UIView!
    @IBOutlet weak var screenDiscription: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var landingColl: UICollectionView!
    
    
    let landingImg = ["screen1","screen2","screen3"]
    
    let titleArray = ["Discover People","Match with them","Chat with them"]
    let descriptionArray = ["Find like minded people to connect with","See who you like and who likes you and connect with them","Chat with your favorite people who you connected with"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = 3
        landingColl.register(UINib(nibName: "LandingCollectionCell", bundle: nil), forCellWithReuseIdentifier: "LandingCollectionCell")
        
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeHandel))
        swipeLeftGesture.direction = .left
           landingColl.addGestureRecognizer(swipeLeftGesture)
    }
    @objc func swipeHandel(){
//        print("||||\(pageControl.currentPage)||")
//        if pageControl.currentPage == 2{
//            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.0){
//                let vc = StoryBoards.auth.instantiateViewController(withIdentifier: "EmailVC") as! EmailVC
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//        }
    }
    
    

}
