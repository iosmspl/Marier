//
//  FaqsVC.swift
//  Marier
//
//  Created by MacBook M1 on 10/05/23.
//

import UIKit

class FaqsVC: UIViewController {
    @IBOutlet weak var FaqsTableView: UITableView!
    var SelectedIndex = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        FaqsTableView.register(UINib(nibName: "FaqusTabeleCell", bundle: nil), forCellReuseIdentifier: "FaqusTabeleCell")
        // Do any additional setup after loading the view.
    }
    @IBAction func BackTapped(_ sender: UIButton) {
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
