//
//  RecentPassesVC.swift
//  Marier
//
//  Created by MacBook M1 on 10/05/23.
//

import UIKit

class RecentPassesVC: UIViewController {
    @IBOutlet weak var RecentlyLiked: UIButton!
    @IBOutlet weak var RecentlyDisliked: UIButton!
    @IBOutlet weak var RecentPassCollectionView: UICollectionView!
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        RecentPassCollectionView.register(UINib(nibName: "RecentPassCollectionCell", bundle: nil), forCellWithReuseIdentifier: "RecentPassCollectionCell")
        // Do any additional setup after loading the view.
    }
    @IBAction func RecentlyLiked(_ sender: UIButton){
        RecentlyLiked.backgroundColor = SetcolorRgb(red: 230, green: 84, blue: 160)
        RecentlyDisliked.backgroundColor = UIColor.clear
        selectedIndex = 0
        RecentPassCollectionView.reloadData()
    }
    @IBAction func RecentlyDisliked(_ sender: UIButton){
        RecentlyLiked.backgroundColor = UIColor.clear
        RecentlyDisliked.backgroundColor = SetcolorRgb(red: 230, green: 84, blue: 160)
        selectedIndex = 1
        RecentPassCollectionView.reloadData()
    }
    
    @IBAction func backTapped(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
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
