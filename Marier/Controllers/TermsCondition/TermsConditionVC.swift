//
//  TermsConditionVC.swift
//  Marier
//
//  Created by MacBook M1 on 29/03/23.
//

import UIKit

class TermsConditionVC: UIViewController {

    @IBOutlet weak var termsCollection: UICollectionView!
    let titleArray = ["Be yourself.","Be cool.","Be safe.","Be active."]
    let descriptionArray = ["Upload only your own photos, age and bio that’s yours","Stay chill and treat others with respect and dignity","Don’t give out personal info too quickly. Guage, analyse and date safely","Report others’ rude or bad behaviour actively so we can keep it safe"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        termsCollection.register(UINib(nibName: "TermsCell", bundle: nil), forCellWithReuseIdentifier: "TermsCell")
    }
    @IBAction func backTapped(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
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
