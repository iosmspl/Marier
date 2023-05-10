//
//  ReportVC.swift
//  Marier
//
//  Created by MacBook M1 on 11/04/23.
//

import UIKit

class ReportVC: UIViewController {

    @IBOutlet weak var ReportTable: UITableView!
    let optionArray = ["inappropriate","Fells Like Spam","User is Underage","Other"]
    override func viewDidLoad() {
        super.viewDidLoad()
        ReportTable.register(UINib(nibName: "ReportTableCell", bundle: nil),forCellReuseIdentifier: "ReportTableCell")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CacelTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
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
