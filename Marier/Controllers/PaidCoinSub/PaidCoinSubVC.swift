//
//  PaidCoinSubVC.swift
//  Marier
//
//  Created by MacBook M1 on 08/05/23.
//

import UIKit

class PaidCoinSubVC: UIViewController {
    @IBOutlet weak var paidCoinCollect: UICollectionView!
    let ImageArray = ["Coin","BagCoin","StackCoin","PiggyBank"]
    let offerArray = ["Most Popular","Save 19%","Save 24%","BestValue"]
//    let PriceArray = ["5 Coin $1.50","10 Coin $3","20 Coin $6.12"]
    override func viewDidLoad() {
        super.viewDidLoad()
        paidCoinCollect.register(UINib(nibName: "PaidPlanCollectionCell", bundle: nil), forCellWithReuseIdentifier: "PaidPlanCollectionCell")
        // Do any additional setup after loading the view.
    }
    @IBAction func backTapped(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    @IBAction func UsageTapped(_ sender: UIButton){
        let vc  = StoryBoards.PaidPlan.instantiateViewController(withIdentifier: "UseCoinVC") as! UseCoinVC
        present(vc, animated: true)
        
    }
    @IBAction func BuyTapped(_ sender: UIButton){
        let vc = StoryBoards.PaidPlan.instantiateViewController(withIdentifier: "BuyCoinVC") as! BuyCoinVC
        present(vc, animated: true)
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
