//
//  PaidPlanVC.swift
//  Marier
//
//  Created by MacBook M1 on 08/05/23.
//

import UIKit

class PaidPlanVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func premiumTapped(_ sender: UIButton){
        let vc = StoryBoards.PaidPlan.instantiateViewController(withIdentifier: "PaidPremiumVC") as! PaidPremiumVC
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    @IBAction func PaidCoinTapped(_ sender: UIButton){
        let vc = StoryBoards.PaidPlan.instantiateViewController(withIdentifier: "PaidCoinSubVC") as! PaidCoinSubVC
        navigationController?.pushViewController(vc, animated: true)
        
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
