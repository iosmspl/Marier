//
//  BuyCoinVC.swift
//  Marier
//
//  Created by MacBook M1 on 09/05/23.
//

import UIKit
import DropDown
class BuyCoinVC: UIViewController {
    @IBOutlet weak var DropDownTabelView: UITableView!
    
    @IBOutlet weak var DropBoxHeight: NSLayoutConstraint!
    
    var selectedIndex = 2
    
    @IBOutlet weak var SelectedOffere_lbl: UILabel!
    @IBOutlet weak var BuyCoinDropdown: UIView!
    var DropDownArray = ["40 for $6.00","45 for $6.00","49 for $6.00","43 for $6.00","41 for $6.00"]
    override func viewDidLoad() {
        super.viewDidLoad()
        DropDownTabelView.register(UINib(nibName: "BuyCoinTabelCell", bundle: nil), forCellReuseIdentifier: "BuyCoinTabelCell")
        SelectedOffere_lbl.text = DropDownArray[selectedIndex]
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        DropBoxHeight.constant = 0
    }
    @IBAction func backTappd(_ sender: UIButton!){
        dismiss(animated: true)
    }
    
    
    @IBAction func DropDownTapped(_ sender: UIButton) {
        if DropBoxHeight.constant == 0{
            DropBoxHeight.constant = 200
            
        }else{
            DropBoxHeight.constant = 0
        }
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
