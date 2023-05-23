//
//  ConnectionLostVC.swift
//  Marier
//
//  Created by MacBook M1 on 23/05/23.
//

import UIKit
import ARSLineProgress
class ConnectionLostVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func tryTapped(_ sender: UIButton){
        ARSLineProgress.show()
        if ReachabilityNetwork.isConnectedToNetwork(){
            ARSLineProgress.hide()
            navigationController?.popViewController(animated: true)
        }else{
            ARSLineProgress.hide()
            AlertDisplay(AlertTitle: "No internet", Message: "please turn on internet", Actiontitle: "OK")
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
