//
//  UerDefaults.swift
//  Marier
//
//  Created by MacBook M1 on 22/05/23.
//

import Foundation
import UIKit

class Defaults{
    static let defaultClass = Defaults()
    private let defaults =  UserDefaults.standard
    // LoginOTP api token
    var logintoken: String{
        get{
            return defaults.value(forKey: "logToken") as! String
        }set{
            defaults.set(newValue, forKey: "logToken")
        }
    }
    
    // verification api tokens
    var token: String{
        get{
            return defaults.value(forKey: "token") as! String
        }set{
            defaults.set(newValue, forKey: "token")
        }
    }
    
    var id: String{
        get{
            return defaults.value(forKey: "id") as! String
        }set{
            defaults.set(newValue, forKey: "id")
        }
    }
    
    // for store enterd text in emailVC
    var mailOrNumber: String{
        get{
            return defaults.value(forKey: "enterdTxt") as! String
        }set{
            defaults.set(newValue, forKey: "enterdTxt")
        }
    }
    

}
