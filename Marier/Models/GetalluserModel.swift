//
//  GetalluserModel.swift
//  Marier
//
//  Created by MacBook M1 on 02/06/23.
//

import Foundation

struct  getAllUser: Codable{
    let pageSize: String?
    let PageNo: String?
    let data: [GetAllUserData]?
}
struct GetAllUserData: Codable{
    let avatar: String?
    let bio: String?
    let _id: String?
    let name: String?
}
