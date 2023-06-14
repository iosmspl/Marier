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
    private let userDataKey = "userDataKey"
    private let GalleryDataKey = "GalleryDataKey"
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
    var loc: String{
        get{
            defaults.value(forKey: "location") as! String
        }set{
            defaults.set(newValue, forKey: "location")
        }
    }
    var pageNo: Int?{
        get{
            defaults.value(forKey: "PageNo") as? Int
        }set{
            defaults.set(newValue, forKey: "PageNo")
        }
    }
    var dislikePageNo: Int?{
        get{
            return defaults.value(forKey: "disPageNo") as? Int
        }set{
            defaults.set(newValue, forKey: "disPageNo")
        }
    }
    var galleryViewPageNo: Int?{
        get{
            defaults.value(forKey: "GalleryPageNo") as? Int
        }set{
            defaults.setValue(newValue, forKey: "GalleryPageNo")
        }
    }
    
    var userdataApi: [GetAllUserData]{
        get{
            if let storedData = defaults.data(forKey: userDataKey) {
                return (try? JSONDecoder().decode([GetAllUserData].self, from: storedData)) ?? []
            }else{
                return []
            }
        }set{
            if let encodedData = try? JSONEncoder().encode(newValue){
                defaults.set(encodedData, forKey: userDataKey)
            }
            
        }
    }
    
    var galleryViewData: [GetAllUserData]{
        get{
            if let storedData = defaults.data(forKey: GalleryDataKey){
                return (try? JSONDecoder().decode([GetAllUserData].self, from: storedData)) ?? []
            }else{
                return []
            }
        }set{
            if let encodedData = try? JSONEncoder().encode(newValue){
                defaults.set(encodedData, forKey: GalleryDataKey)
            }
        }
        
        
        
    }
    func removeAllUserdata() {
        defaults.removeObject(forKey: userDataKey)
    }
    func removGallerydata(){
        defaults.removeObject(forKey: GalleryDataKey)
    }
}
