//
//  GalleryVCViewController.swift
//  Marier
//
//  Created by MacBook M1 on 05/04/23.
//

import UIKit

class GalleryVC: UIViewController {
    @IBOutlet weak var GalleryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GalleryCollectionView.register(UINib(nibName: "GalleryCollecViewCell", bundle: nil), forCellWithReuseIdentifier: "GalleryCollecViewCell")
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func FilterTapped(_ sender: UIButton) {
        let filterVC = StoryBoards.Discover.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
        navigationController?.pushViewController(filterVC, animated: true)
        
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
