//
//  OTPVC.swift
//  Marier
//
//  Created by MacBook M1 on 28/03/23.
//

import UIKit
import ARSLineProgress
//import OTPTextField
class OTPVC: UIViewController {
    @IBOutlet weak var lblCodeSent: UILabel!
    
    @IBOutlet weak var firstTxtField: UITextField!
    @IBOutlet weak var secondTxtField: UITextField!
    @IBOutlet weak var thirdTxtField: UITextField!
    @IBOutlet weak var fourthTxtField: UITextField!
    var resend: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        lblCodeSent.text = "Please enter the 4-digit code sent to you at \(Defaults.defaultClass.mailOrNumber)"
                let textFieldArray = [firstTxtField,secondTxtField,thirdTxtField,fourthTxtField]
        for filed in textFieldArray {
            filed?.delegate = self
        }
        firstTxtField.becomeFirstResponder()
//         Do any additional setup after loading the view.
        
//        ApiManger.Shared.getCurrentUserApi { resdata, isSuccess in
//            print(" get user compilation")
//        }
    }
    
       
   
    
    @IBAction func submitTapped(_ sender: UIButton){
        if ReachabilityNetwork.isConnectedToNetwork(){
            if firstTxtField.text == "" && secondTxtField.text == "" && thirdTxtField.text == "" && fourthTxtField.text == ""{

                AlertDisplay(AlertTitle: "otp missing", Message: "please flll complete otp", Actiontitle: "OK")
                print("please enter all the fileds")
            }else{
                ARSLineProgress.show()
                let otpText: String = firstTxtField.text! + secondTxtField.text! + thirdTxtField.text! + fourthTxtField.text!
                print("\(otpText)")
                let otpmodel = Otp(otp: otpText)
                ApiManger.Shared.OtpVerify(otp: otpmodel) { resData,phoneNo, isSuccess in
                    if isSuccess == true {
                        ARSLineProgress.hide()
                        print("\\|\(phoneNo)|")
                        let vc = StoryBoards.auth.instantiateViewController(withIdentifier: "BasicGuideLinesVC") as! BasicGuideLinesVC
                        self.navigationController?.pushViewController(vc, animated: true)
                    }else{
                        ARSLineProgress.hide()
                        self.AlertDisplay(AlertTitle: "\(resData?.message ?? "something wrong")", Message: "", Actiontitle: "OK")
                        print(" failure || otp vc")
                    }
                }
            }

        }else{
            ARSLineProgress.hide()
            print("somthing wrong|otpvc|")
        }
//
//        let vc  = StoryBoards.auth.instantiateViewController(withIdentifier: "BasicGuideLinesVC") as! BasicGuideLinesVC
//                   navigationController?.pushViewController(vc, animated: true)

        
    }
    @IBAction func resendTapped(_ sender: UIButton){
        if ReachabilityNetwork.isConnectedToNetwork(){
            ARSLineProgress.show()
            let txtFieldArr = [firstTxtField,secondTxtField,thirdTxtField,fourthTxtField]
            for element in txtFieldArr {
                element?.text = ""
            }
            firstTxtField.becomeFirstResponder()
          let txt = Defaults.defaultClass.mailOrNumber
         if isGmailAddress(txt) {
             let model = loginOtpInput(phoneNumber: "", email: txt)
             ApiManger.Shared.LoginOtpApi(OtpModel: model) { isSuccess,resdata  in
                 ARSLineProgress.hide()
                 if isSuccess {
                     print("|otpvc|\(resdata?.message!)")
                 }
             }

         }else if isPhoneNumber(txt){
             let model = loginOtpInput(phoneNumber: txt, email: "")
             ApiManger.Shared.LoginOtpApi(OtpModel: model) { isSuccess,resdata  in
                 ARSLineProgress.hide()
                 if isSuccess {
                     print("|resend| \(resdata?.message!)")
                 }

             }
         }else{
             ARSLineProgress.hide()
             print("somthin wrong |resend|")
         }

        }else{
            ARSLineProgress.hide()
            let vc  = StoryBoards.auth.instantiateViewController(withIdentifier: "ConnectionLostVC") as! ConnectionLostVC
            navigationController?.pushViewController(vc, animated: true)
        }
//        let vc  = StoryBoards.auth.instantiateViewController(withIdentifier: "ConnectionLostVC") as! ConnectionLostVC
//                   navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func backTapped(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
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
