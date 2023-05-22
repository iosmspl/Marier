//
//  EmailVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 19/05/23.
//

import Foundation
import UIKit
extension EmailVC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
