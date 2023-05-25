//
//  ApiUrls.swift
//  Marier
//
//  Created by MacBook M1 on 17/05/23.
//

import Foundation
 public var BaseUrl =  "http://marier.one:9001/api/v1"
struct ApiUrls{
    public static let loginOtpUrl =  BaseUrl+"/users/loginOtp"
    public static let otpVerify   =  BaseUrl+"/users/loginOtpVerification"
    public static let upDateApi   =  BaseUrl+"/users/update/"

}
