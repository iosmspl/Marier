//
//  ApiUrls.swift
//  Marier
//
//  Created by MacBook M1 on 17/05/23.
//

import Foundation
 public var BaseUrl =  "http://marier.one:9001/api/v1"
struct ApiUrls{
    public static let loginOtpUrl                     =  BaseUrl+"/users/loginOtp"
    public static let otpVerify                       =  BaseUrl+"/users/loginOtpVerification"
    public static let upDateApi                       =  BaseUrl+"/users/update/"
    public static let getAllInterests                 =  BaseUrl+"/interests/getAll"
    public static let sexualOrientionGetall           =  BaseUrl+"/sexualOrientations/getAll"
    public static let addInterests                    =  BaseUrl+"/users/addIntersts/"
    public static let uploadImages                    =  BaseUrl+"/users/uploadImagesByUserId/"
}
