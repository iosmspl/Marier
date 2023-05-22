//
//  Screen.swift
//  Marier
//
//  Created by MacBook M1 on 22/03/23.
//

import Foundation
import UIKit

extension UIViewController{
    ///
    func AddChild(_ viewController:UIViewController, inView view:UIView){
        self.addChild(viewController)
        viewController.view.frame = view.frame
        self.view.addSubview(viewController.view)
       viewController.didMove(toParent: self)
    }
    // MARK: - for color change
    func SetcolorRgb(red: Int,green: Int ,blue: Int) -> UIColor{
        let redValue: CGFloat = CGFloat(red)/255 // 0.392
        let greenValue: CGFloat = CGFloat(green)/255 // 0.588
        let blueValue: CGFloat = CGFloat(blue)/255 // 0.784
        

        // Create a UIColor object with the desired RGB values
        let myColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)

        // Set the background color of the view to the UIColor object
       return myColor
    }
    
    
    
    //MARK: - TO SCROLE TABEL TO BOTTOM
    func tabelToscrole(Row: Int, tabletoScrolle: UITableView){
        let indexpath = IndexPath(row: Row, section: 0)
        tabletoScrolle.scrollToRow(at: indexpath, at: .bottom, animated: true)
    }
    
    // MARK: - to  check validation
    func AlertDisplay(AlertTitle: String , Message: String, Actiontitle: String){
        let Alert = UIAlertController(title: AlertTitle, message: Message, preferredStyle: .alert)
        let Ok = UIAlertAction(title: Actiontitle, style: .cancel)
        Alert.addAction(Ok)
        present(Alert, animated: true)
    }
    
    // MARK: - to check its number or email
    func isGmailAddress(_ string: String) -> Bool {
        let gmailRegex = "[A-Za-z0-9._%+-]+@gmail.com"
        let gmailPredicate = NSPredicate(format: "SELF MATCHES %@", gmailRegex)
        return gmailPredicate.evaluate(with: string)
    }

    func isPhoneNumber(_ string: String) -> Bool {
        let phoneRegex = "^\\d{10}$" // Assuming a 10-digit phone number format
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: string)
    }
}
