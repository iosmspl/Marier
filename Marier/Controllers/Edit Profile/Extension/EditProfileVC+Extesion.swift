//
//  EditProfileVC+Extesion.swift
//  Marier
//
//  Created by MacBook M1 on 06/05/23.
//

import Foundation
import UIKit

extension EditProfileVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
