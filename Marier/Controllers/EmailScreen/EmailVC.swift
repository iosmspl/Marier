//
//  EmailVC.swift
//  Marier
//
//  Created by MacBook M1 on 27/03/23.
//

import UIKit
import ARSLineProgress
class EmailVC: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var EmailVCBgHeight: NSLayoutConstraint!
    @IBOutlet weak var scrolleView: UIScrollView!
    var height = 720
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
        let topOffset = CGPoint(x: 0, y: (frameHeight.height))
        scrolleView.setContentOffset(topOffset, animated: true)
    }
    @objc func keyboardWillhide(){
        EmailVCBgHeight.constant = 720
    }
    
    
    
    
    @IBAction func continueTapped(_ sender: UIButton){
//        ARSLineProgress.show()
      if ReachabilityNetwork.isConnectedToNetwork(){
          if email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {

             AlertDisplay(AlertTitle: "Field Missing", Message: "Please enter email or PhoneNumber", Actiontitle: "OK")
          }else {
              ARSLineProgress.show()
              let vc = StoryBoards.auth.instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
              Defaults.defaultClass.mailOrNumber = email.text!
              if isGmailAddress(email.text!){
                  let model = loginOtpInput(phoneNumber: "" , email:  email.text!)
                  ApiManger.Shared.LoginOtpApi(OtpModel: model) { isSuccess,resdata  in
                      if isSuccess == true{
                          ARSLineProgress.hide()
                    self.navigationController?.pushViewController(vc, animated: true)
                      }else {
                          ARSLineProgress.hide()
                          print("||error|| EmailVC")
                      }
                  }

              }else if isPhoneNumber(email.text!){
                  let model = loginOtpInput(phoneNumber: email.text! , email: "")
                  ApiManger.Shared.LoginOtpApi(OtpModel: model) { isSuccess,resdata  in
                      if isSuccess == true{
                          ARSLineProgress.hide()
                        self.navigationController?.pushViewController(vc, animated: true)
                      }else {
                          ARSLineProgress.hide()
                          print("||error|| EmailVC")
                      }
                  }

              } else{
                  ARSLineProgress.hide()
                  AlertDisplay(AlertTitle: "Validation Faild", Message: "please enter proper number or email", Actiontitle: "OK")
                  print(" plese enter valid mail or number")
              }

          }

        }else{
            ARSLineProgress.hide()
            let vc = StoryBoards.auth.instantiateViewController(withIdentifier: "ConnectionLostVC") as! ConnectionLostVC
            navigationController?.pushViewController(vc, animated: true)
            print("somthing Went Wrong")
        }
        print("t = \(Defaults.defaultClass.token)")
        print("id = \(Defaults.defaultClass.id)")
//        ApiManger.Shared.getlikesByOther {resdata,isSuccess in
//            print("comilation")
//        }
//        UserDefaults.standard.removeObject(forKey: "PageNo")
        Defaults.defaultClass.removeAllUserdata()
        Defaults.defaultClass.removGallerydata()
        UserDefaults.standard.removeObject(forKey: "PageNo")
        UserDefaults.standard.removeObject(forKey: "GalleryPageNo")
//
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
