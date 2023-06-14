//
//  ApiUrls.swift
//  Marier
//
//  Created by MacBook M1 on 17/05/23.
//

import Foundation
 public var BaseUrl =  "http://173.249.48.121:9001/api/v1"
struct ApiUrls{
    public static let loginOtpUrl                     =  BaseUrl+"/users/loginOtp"
    public static let otpVerify                       =  BaseUrl+"/users/loginOtpVerification"
    public static let upDateApi                       =  BaseUrl+"/users/update/"
    public static let getAllInterests                 =  BaseUrl+"/interests/getAll"
    public static let sexualOrientionGetall           =  BaseUrl+"/sexualOrientations/getAll"
    public static let addInterests                    =  BaseUrl+"/users/addIntersts/"
    public static let uploadImages                    =  BaseUrl+"/users/uploadImagesByUserId/"
    public static let AddSexualityApi                 =  BaseUrl+"/users/addSexualOrientaion/"
    public static let getCurrentUser                  =  BaseUrl+"/users/current/"
    public static let ProfileImgUpload                =  BaseUrl+"/users/profileImageUpload/"
    public static let getAlluser                      =  BaseUrl+"/users/getAllUser"
    public static let createLikes                     =  BaseUrl+"/likes/create"
    public static let createSuperLikes                =  BaseUrl+"/likes/superLike"
    public static let createDislikes                  =  BaseUrl+"/dislikes/create"
    public static let getLikesByOther                 =  BaseUrl+"/likes/likesByOther/"
    public static let getDislikesByOther              =  BaseUrl+"/dislikes/getDislikes/"
    public static let getFaqs                         =  BaseUrl+"/faqs/getAll"
}
