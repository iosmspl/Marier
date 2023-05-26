//
//  UserModel.swift
//  Marier
//
//  Created by MacBook M1 on 22/05/23.
//

import Foundation
 
// MARK: - LOGIN OTP MODEL
struct loginOtpInput: Encodable{
    let phoneNumber: String?
    let email: String?
}
 
struct loginOtpData: Codable{
    let data: TokenStr?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case message = "message"
    }
}
struct TokenStr: Codable{
    let token: String?
    enum CodingKeys: String ,CodingKey {
        case token = "token"
    }
}
    // MARK: - OTP VERIFICATION MODEL
    struct Otp: Encodable{
        let otp: String?
    }
    struct otpVerifyRes: Codable{
        let data: dataObj?
        let message: String?
        let token: String?
        enum CodingKeys: String,CodingKey {
            case data = "data"
            case message = "message"
            case token = "token"
        }
    }
    struct dataObj: Codable{
        let avatar: String?
        let sexualOrientations: [String]?
//        let phoneNumber: NSNumber?
        let interests: [String]?
        let socialLogin: SocialLogin?
        let createdAt, updatedAt, status, email: String?
        let name, sex, dob, loc: String?
        let id, uuid: String?
        let setting: Setting?
        let ipAddress, platform: String?
        let gallery: [String]?
        
            }
    struct SocialLogin: Codable{
        let to: String?
        let from: String?
    }
    struct Setting: Codable{
        let sexType: String?
        let distance: Int?
        let language: String?
        let location: LocationData?
        let ageRange: AgeRange?
        
    }
    struct LocationData: Codable{
        let type: String?
        let coordinates: [Double]?
    }
    struct AgeRange: Codable{
        let to: Int?
        let from: Int?
    }
    
    
//MARK: - UPDATE USER API  MODEL

// ----------parameter--------------- start
struct UpdateApiParmes: Encodable{
    let name: String?
//    let phoneNumber: String?
    let sex: String?
    let dob: String?
    let address: String?
    let setting: Settings?
}
struct Settings: Encodable{
    let location: Loc?
//    let ageRange: ageRang?
//    let distance: Int?
//    let sexType: String?
//    let language: String?
    
}
struct Loc: Encodable{
    let type: String?
    let coordinates: [String]?
    
}
struct ageRang: Encodable{
    let to: Int?
    let from: Int?
}
//------------parameter------------------end
//-------------RESPONSE------------------star
struct updateApiRes: Codable{
    let message: String?
    let data: updateApiData?
}
struct updateApiData: Codable{
    let _id,token: String?
}
//-------------^^^^^^--------------------end


//MARK: - GETALL INTEREST   API MODEL-------

struct GetAllInterests: Codable {
    let message: String?
    let data: [GetallInterData]?
}
struct GetallInterData: Codable{
    let _id: String?
    let interest: String?
    enum CodingKeys:  String,CodingKey {
        case _id
        case interest = "type"
    }
}

//MARK: - INTEREST UPDATE API ---------------
struct updateInterestApi: Encodable{
    let interests: [String]?
}

