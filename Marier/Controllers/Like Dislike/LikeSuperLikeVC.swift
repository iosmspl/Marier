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
    var likedbyUserArray = [LikeByOtherData]()
    var dislikeUsersArray = [DisLikeByOtherData]()
    var isFetched = false
//    var dislikedByOther
    override func viewDidLoad() {
        super.viewDidLoad()
//
        if Defaults.defaultClass.dislikePageNo == nil {
            Defaults.defaultClass.dislikePageNo = 1
        }
        LikeSuperLikeCollectionView.register(UINib(nibName: "RecentPassCollectionCell", bundle: nil), forCellWithReuseIdentifier: "RecentPassCollectionCell")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        // like by other
        ApiManger.Shared.getlikesByOther { resdata, isSuccess in
            if isSuccess{
                self.likedbyUserArray = resdata?.data! ?? [LikeByOtherData]()
                self.LikeSuperLikeCollectionView.reloadData()
                self.LikeSuperLikeCollectionView.delegate = self
            }else{
                print("likesupervc to dekho")
            }
        }
        
        // dilike by other
        ApiManger.Shared.getAlldislikes(pageNo: Defaults.defaultClass.dislikePageNo!, pageSize: 10) { resdata, isSuccess in
            if isSuccess{
                self.dislikeUsersArray = resdata?.data ?? [DisLikeByOtherData]()
                self.LikeSuperLikeCollectionView.reloadData()
                
            }else{
                print("like super like vc = fail")
            }
        }
        
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
