//
//  EmailVC.swift
//  Marier
//
//  Created by MacBook M1 on 27/03/23.
//

import UIKit

class EmailVC: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var EmailVCBgHeight: NSLayoutConstraint!
    var height = 740
    override func viewDidLoad() {
        super.viewDidLoad()
        email.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillhide), name: UIResponder.keyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    @objc func keyboardShow(_ notification: Notification){
        guard let frameHeight = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        EmailVCBgHeight.constant = frameHeight.height + CGFloat(height)
    }
    @objc func keyboardWillhide(){
        EmailVCBgHeight.constant = 740
    }
    
    
    
    
    @IBAction func continueTapped(_ sender: UIButton){
        
//        print("||\(email.text?.trimmingCharacters(in: .whitespacesAndNewlines))||")
      if ReachabilityNetwork.isConnectedToNetwork(){
          if email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
             AlertDisplay(AlertTitle: "Field Missing", Message: "Please enter email or PhoneNumber", Actiontitle: "OK")
          }else {
              if isGmailAddress(email.text!){
                  print("||Gmail||")
                  let model = loginOtpInput(phoneNumber: "" , email:  email.text!)
//                  let model = ["email": email.text!]
                  ApiManger.Shared.LoginOtpApi(OtpModel: model)
                  
              }else if isPhoneNumber(email.text!){
                  print("||number||")
                  let model = loginOtpInput(phoneNumber: email.text! , email: "")
                  ApiManger.Shared.LoginOtpApi(OtpModel: model)
                  
              } else{
                  print(" plese enter valid mail or number")
              }
              
          }

        }else{
            print("somthing Went Wrong")
        }
            
//        let vc = StoryBoards.auth.instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
//        self.navigationController?.pushViewController(vc, animated: true)
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
        let vc = StoryBoards.auth.instantiateViewController(withIdentifier: "TermCondtionVC") as! TermCondtionVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
