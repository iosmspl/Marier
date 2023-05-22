//
//  MyPhotosVC.swift
//  Marier
//
//  Created by MacBook M1 on 19/05/23.
//

import UIKit

class MyPhotosVC: UIViewController {
    @IBOutlet weak var MyphotosCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        MyphotosCollectionView.register(UINib(nibName: "MyphotosCell", bundle: nil), forCellWithReuseIdentifier: "MyphotosCell")
        // Do any additional setup after loading the view.
    }
    @IBAction func BackTapped(_ sender: UIButton){
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
