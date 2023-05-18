//
//  MessageVC.swift
//  Marier
//
//  Created by MacBook M1 on 15/05/23.
//

import UIKit

class MessageVC: UIViewController {
    @IBOutlet weak var MessageTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MessageTabelView.register(UINib(nibName: "MessageTabelCell", bundle: nil), forCellReuseIdentifier: "MessageTabelCell")

        // Do any additional setup after loading the view.
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
