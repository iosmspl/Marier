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
}
