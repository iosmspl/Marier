//
//  LikeDislikeVC.swift
//  Marier
//
//  Created by MacBook M1 on 12/05/23.
//

import UIKit

class LikeSuperLikeVC: UIViewController {
    @IBOutlet weak var LikeSuperLikeCollectionView: UICollectionView!
    @IBOutlet weak var Likebtn: UIButton!
    @IBOutlet weak var SuperLikebtn: UIButton!
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        LikeSuperLikeCollectionView.register(UINib(nibName: "RecentPassCollectionCell", bundle: nil), forCellWithReuseIdentifier: "RecentPassCollectionCell")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LikedTapped(_ sender: UIButton){
        Likebtn.backgroundColor = SetcolorRgb(red: 230, green: 84, blue: 160)
        SuperLikebtn.backgroundColor = UIColor.clear
        selectedIndex = 0
        LikeSuperLikeCollectionView.reloadData()
    }
    @IBAction func SuperLikedTapped(_ sender: UIButton){
        Likebtn.backgroundColor = UIColor.clear
        SuperLikebtn.backgroundColor = SetcolorRgb(red: 230, green: 84, blue: 160)
        selectedIndex = 1
        LikeSuperLikeCollectionView.reloadData()
    }
    @IBAction func SeeWholikedTapped(_ sender: UIButton){
        let tabvc = StoryBoards.Discover.instantiateViewController(withIdentifier: "TabBarVc") as! TabBarVc
        tabvc.selectedIndex = 2
        navigationController?.pushViewController(tabvc, animated: true)
        
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
