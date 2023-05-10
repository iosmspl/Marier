//
//  EmailVC.swift
//  Marier
//
//  Created by MacBook M1 on 27/03/23.
//

import UIKit

class EmailVC: UIViewController {
    @IBOutlet weak var email: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueTapped(_ sender: UIButton){
        let vc = StoryBoards.auth.instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func googleTapped(_ sender: UIButton){
        
    }
    @IBAction func facbookTapped(_ sender: UIButton){
        
    }
    @IBAction func appleTapped(_ sender: UIButton){
        
    }
    @IBAction func troubleLogTapped(_ sender: UIButton){
        let vc = StoryBoards.auth.instantiateViewController(withIdentifier: "LoginWithPhoneVC") as! LoginWithPhoneVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func privacyTapped(_ sender: UIButton){
        let vc = StoryBoards.auth.instantiateViewController(withIdentifier: "TermsConditionVC") as! TermsConditionVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
