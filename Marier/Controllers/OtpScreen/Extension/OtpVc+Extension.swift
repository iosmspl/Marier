//
//  OtpVc+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 19/05/23.
//

import Foundation
import UIKit
//import OTPTextField
extension OTPVC: UITextFieldDelegate{
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print("||\(string.count)||")
//        print("\(textField.text?.count)")
        if (textField.text?.count)! < 1 && string.count > 0{
            if textField == firstTxtField{
                secondTxtField.becomeFirstResponder()
            }
            if textField == secondTxtField{
                thirdTxtField.becomeFirstResponder()
            }
            if textField == thirdTxtField{
                fourthTxtField.becomeFirstResponder()
            }
            if textField == fourthTxtField{
                textField.resignFirstResponder()
            }
//            print(string)
            textField.text = string
            return false
        }else if (textField.text?.count)! >= 1 && string.count == 0{
            if textField == fourthTxtField{
                thirdTxtField.becomeFirstResponder()
            }
            if textField == thirdTxtField{
                secondTxtField.becomeFirstResponder()
            }
            if textField == secondTxtField{
                firstTxtField.becomeFirstResponder()
            }
            textField.text = ""
            return false
        }else if (textField.text?.count)! >= 1 {
//            print("\(string)")
            textField.text = string
            return false
        }
        return true
    }
    
    
   
    
}

