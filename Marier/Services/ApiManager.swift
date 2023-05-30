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
//                            print("-----\(token) -----")
//                            print("-----\(Defaults.defaultClass.logintoken) -----")

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
            print("||\(json!)||")
            if status == 200{
                
                let token = (respdata?.token)!
//                print("----vr-\(token!)")
                let Id = (respdata?.data?.id)!
//                print("----vrid-\(Id)")

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
    
    //MARK: - THIS IS GET ALL SEXULAITY API
    func getAllsexuality(comilation: @escaping(_ resdata: sexualOriention? ,_ isSucces: Bool)-> Void){
        
        AF.request(ApiUrls.sexualOrientionGetall,method: .get).response{response in  switch response.result{
            
        case .success(let data):
            let json = try? JSONSerialization.jsonObject(with: data!) as? [String:Any]
            let RespData = try? JSONDecoder().decode(sexualOriention.self, from: data!)
            let status = response.response?.statusCode
            if status == 200 {
                print("---suc \(json!)")
                comilation(RespData,true)
            }else{
                print("-\(status!) = \(json!)")
                comilation(nil , false)
            }
            
        case .failure(let error):
            comilation(nil , false)
            print("-F-\(error.localizedDescription)-=")
        }
            
        }
    }
    
    
    // MARK: - THIS ADD SEXUAL ORIENTAION
    
    func addSexualOrientaion(comilation: @escaping(_ resdata: sexualOriention? ,_ isSucces: Bool)-> Void){
        let headApi: HTTPHeaders = ["x-access-token": Defaults.defaultClass.token]
        
    }
    
    //----------------MARK: - THIS IS UDATE INTERESTS-----------
    func updateInterest(model: updateInterestApi, compilation: @escaping(_ resdata: String? ,_ isSuccess:Bool )-> Void){
        
        let token:String = Defaults.defaultClass.token
        let headApi:HTTPHeaders = ["x-access-token": token]
        AF.request(ApiUrls.addInterests+Defaults.defaultClass.id , method: .put , parameters: model, encoder: JSONParameterEncoder.default , headers: headApi).response{ response in switch response.result{
            
        case .success(let data):
            let json = try? JSONSerialization.jsonObject(with: data!) as? [String:Any]
//            let apiData = try? JSONDecoder().decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)
            let status = response.response?.statusCode
            let data = json?["data"] as? String

            if status == 200{
                print("---addinters---\(json)----")
//                let data = json?["data"] as? String
                compilation(data, true)
            }
            else{
                compilation(data, false)
            }
           
        case .failure(let error):
            compilation(nil ,false)
            print("\(error)")
        }}
    }
    
    //MARK: - THIS IS MULTI PHOTO UPLOAD API
    func uploadImagesApi(images: [UIImage], completion: @escaping (_ isSuccess: Bool, _ errorMessage: String?) -> Void) {
//        print("\(Defaults.defaultClass.id)")
        
//        let url = "http://marier.one:9001/api/v1/users/uploadImagesByUserId/646b529c6ba4d63cb9d56fa3"
//        print("arr\(images)")
        AF.upload(multipartFormData: { multipartFormData in
            for (index, image) in images.enumerated() {
                if let imageData = image.jpegData(compressionQuality: 0.5) ?? image.pngData() {
                    let fileName = "image\(index)"
                    let mimeType = image.jpegData(compressionQuality: 1.0) != nil ? "image/jpeg" : "image/png"
                    
                    multipartFormData.append(imageData, withName: "image", fileName: fileName, mimeType: mimeType)
                }
            }
        }, to: ApiUrls.uploadImages+Defaults.defaultClass.id , method: .put).response { response in
            if let statusCode = response.response?.statusCode {
                switch response.result {
                case .success(let data):
                    if statusCode == 200 {
                        let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                        let message = json?["message"] as? String
                        completion(true, message)
                    } else {
                        completion(false, "Unexpected response status code: \(statusCode)")
                    }
                case .failure(let error):
                    completion(false, error.localizedDescription)
                }
            } else {
                completion(false, "No response status code received")
            }
        }
    }

    

    
}
