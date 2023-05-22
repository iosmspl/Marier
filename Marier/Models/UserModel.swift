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
    // MARK: - OTP VERIFICATION MODEL
    struct otp: Encodable{
        let otp: String?
    }
    struct otpVerifyRes: Codable{
        let data: dataObj?
        let message: String?
        let token: String?
        enum CodingKeys:  String,CodingKey {
            case data = "data"
            case message = "message"
            case token = "token"
        }
        
    }
    struct dataObj: Codable{
        let avatar: String?
        let sexualOrientations: [String]?
        let phoneNumber: Decimal?
        let interests: [String]?
        let socialLogin: SocialLogin?
        let createdAt, updatedAt, status, email: String?
        let name, sex, dob, loc: String?
        let id, uuid: String?
        let setting: Setting?
        let ipAddress, platform: String?
        let gallery: [String]?
        
            }
    
    
}
