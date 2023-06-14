//
//  CurrentUserModel.swift
//  Marier
//
//  Created by MacBook M1 on 02/06/23.
//

import Foundation
//MARK: - GET CURRENT USER STRUC
struct responseCurrentUser: Codable{
    
    let data: CurrentDataApi?
}
struct CurrentDataApi: Codable{
    let avatar: String?
    let gallery: [Gallery]?
    let interests: [GetallInterData]
    let bio: String?
    let name: String?
    let sex: String?
    let loc: String?
    let setting: Setting?
}
