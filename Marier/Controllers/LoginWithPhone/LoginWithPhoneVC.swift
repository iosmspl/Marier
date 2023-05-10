//
//  LoginWithPhoneVC.swift
//  Marier
//
//  Created by MacBook M1 on 27/03/23.
//

import UIKit

class LoginWithPhoneVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTapped(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueTapped(_ sender: UIButton){
        let vc = StoryBoards.auth.instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
