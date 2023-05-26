//
//  ApiManager.swift
//  Marier
//
//  Created by MacBook M1 on 20/05/23.
//

import Foundation
import UIKit
import Alamofire
class ApiManger: UIViewController{
    static let Shared = ApiManger()
    
// MARK: - Login Otp api Call
    func LoginOtpApi(OtpModel: loginOtpInput,compilation: @escaping(_ isSuccess: Bool , _ resdata: loginOtpData? )-> Void){
        AF.request(ApiUrls.loginOtpUrl, method: .post , parameters: OtpModel , encoder: JSONParameterEncoder.default).response{response in switch response.result{
        case .success(let data):do{
//                        let json = try? JSONSerialization.jsonObject(with: data!) as? [String:Any]
                        let LoginData =  try! JSONDecoder().decode(loginOtpData.self, from: data!)
                        let status = response.response?.statusCode
                        if status == 200{
                        let token = LoginData.data?.token ?? ""
                        Defaults.defaultClass.logintoken = token
                            print("-----\(token) -----")
                            print("-----\(Defaults.defaultClass.logintoken) -----")

                            compilation(true, LoginData)
                        }else{
                            compilation(false, nil)
                            print("||\(LoginData.message ?? "no message")||")
                        }
                    }
        case .failure(let error):
            compilation(false, nil)
            print("||\(error)||")

        }

        }
          
    }
    // MARK: -  OTP VERIFICATION CALL
    func OtpVerify(otp: Otp?, compilation: @escaping(_ resData: otpVerifyRes?,_ phoneNo: NSNumber?,_ isSuccess: Bool  )-> Void){
        
        let header: HTTPHeaders = ["x-access-token": Defaults.defaultClass.logintoken]
        AF.request(ApiUrls.otpVerify, method: .post , parameters: otp , encoder: JSONParameterEncoder.default , headers: header).response{response in switch response.result{
            
        case .success(let data):do{
            let json = try? JSONSerialization.jsonObject(with: data!) as? [String:Any]
            let respdata = try? JSONDecoder().decode(otpVerifyRes.self, from: data!)
            let status = response.response?.statusCode
            if status == 200{
//                print("||\(json!)||")
                let token = (respdata?.token)!
                let Id = (respdata?.data?.id)!
                let jsonData = json?["data"] as? [String:Any]
//                print("------->\(jsonData)")
//                let  phone = "\((jsonData?["phoneNumber"])!)"
                let phone = (jsonData?["phoneNumber"]) as? NSNumber
                Defaults.defaultClass.token = token
                Defaults.defaultClass.id = Id
                compilation(respdata,phone, true)
            }else{
                print("|apim| \(respdata?.message ?? "no message")")
                compilation(respdata,nil, false)
            }
           
        }
        case .failure(let error):
            print(error.localizedDescription)
            compilation( nil ,nil, false)
        }}
        
    }
    
    // MARK: - THIS IS UPDATE API
    
    func updateApi(model: UpdateApiParmes, compilation: @escaping( _ resData: updateApiRes?, _ isSuccess: Bool)-> Void){
        let headerApi: HTTPHeaders = ["x-access-token": Defaults.defaultClass.token]
        AF.request(ApiUrls.upDateApi+Defaults.defaultClass.id , method: .put , parameters: model , encoder: JSONParameterEncoder.default , headers: headerApi).response{ response in switch response.result{
            
        case .success(let data):
            let json = try? JSONSerialization.jsonObject(with: data!) as? [String: Any]
            let respData = try? JSONDecoder().decode(updateApiRes.self, from: data!)
            let status =  response.response?.statusCode
            if status == 200 {
                print("|u|\(json!)")
                Defaults.defaultClass.token = (respData?.data?.token)!
                Defaults.defaultClass.id = (respData?.data?._id)!
                
                compilation(respData, true)
            }else{
                compilation(nil, false)
                print("\(json!)")
//                print("|u|\(status!)")
            }
        case .failure(let error):
            compilation(nil, false)
            print("|u|\(error.localizedDescription)")
        }}
    }
    
    // ----------------- MARK: - THIS IS GET ALL INTERESTS
    
    func getAllInterApi(compilation: @escaping(_ resdata: GetAllInterests? ,_ isSuccess: Bool)-> Void){
        let headerApi: HTTPHeaders = ["x-access-token": Defaults.defaultClass.token]
        
        AF.request(ApiUrls.getAllInterests, method: .get , headers: headerApi).response{response in switch response.result{
            
        case .success(let data):
            let json = try? JSONSerialization.jsonObject(with: data!) as? [String:Any]
            let respData = try? JSONDecoder().decode(GetAllInterests.self, from: data!)
            let status = response.response?.statusCode
            if status == 200{
//                print("--resdata\(respData?.data?[0]._id)")
//                print("--resdata\(respData?.data?[0].interest)")
//
//                print("------\(json)")
                compilation(respData, true)
            
            }else{
                compilation(nil, false)
                print("---\(status)")
            }
            
        case .failure(let error):
            compilation(nil, false)
            print("---\(error.localizedDescription)--")
        }}
    }
    
    //----------------MARK: - THIS IS UDATE INTERESTS-----------
    func updateInterest(model: updateInterestApi, compilation: @escaping(_ resdata: String? ,_ isSuccess:Bool )-> Void){
        
    }
    
}
