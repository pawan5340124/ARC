//
//  ChApi.swift
//  ARC
//
//  Created by Pawan Kumar on 25/09/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import Foundation
import Alamofire


//MARK: - ApiDelegate
public protocol ApiResponceDelegateARC {
    func ApiResponceSuccess(Success : NSDictionary)
    func ApiResponceFailure(Failure : NSDictionary)
}

//MARK: - ApiCode
public class ChApi{

    
//    //MARK: - APiHit
    public func ApiHitUsingPostMethod( APiUrl: NSString,HeaderParameter : [String: String] , BodyParameter: NSDictionary,ApiName : String,Log : Bool,Controller : UIViewController) {

        let Delegate : ApiResponceDelegateARC? = Controller as? ApiResponceDelegateARC
        var url = APiUrl
        url = url.replacingOccurrences(of: " ", with: "%20") as NSString
        URLCache.shared.removeAllCachedResponses()

        //Create a non-caching configuration.
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        config.urlCache = nil

        
        Alamofire.request(url as String , method: .post, parameters: BodyParameter as? Parameters,headers:HeaderParameter).responseJSON { response in

            if Log == true{
                print("API NAME :-  \(ApiName)")
                print("API URL :-  \(APiUrl)")
                print("API HeaderParameter :-  \(HeaderParameter)")
                print("API BodyParameter :-  \(BodyParameter)")
                print("API Result :-  \(response)")
            }
            
            let InternetCheck = NetworkReachabilityManager()!.isReachable
            if InternetCheck == false{
                let JSON = ["message":"Please check internet connection.","ApiName":ApiName,"status":"001"]
                Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
            }
            else{
                
                let statusCode = (response.response?.statusCode) ?? 0 //example : 200
                
                if statusCode == 200{
                    if let JSON = response.result.value {
                        let sessionExpireJson = JSON as! NSDictionary
                        let GetAllApiData : NSMutableDictionary = NSMutableDictionary.init(dictionary: sessionExpireJson)
                        GetAllApiData.setValue(ApiName, forKey: "ApiName")
                        Delegate?.ApiResponceSuccess(Success: GetAllApiData)
                    }
                    else{
                        let JSON = ["message":"Due to some reason error occur please try again","ApiName":ApiName,"status":"002"]
                        Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
                    }
                }
                else{
                    if let JSON = response.result.value {
                        let sessionExpireJson = JSON as! NSDictionary
                        let GetAllApiData : NSMutableDictionary = NSMutableDictionary.init(dictionary: sessionExpireJson)
                        GetAllApiData.setValue(ApiName, forKey: "ApiName")
                        Delegate?.ApiResponceFailure(Failure: GetAllApiData as NSDictionary)
                    }
                    else{
                        let JSON = ["message":"Due to some reason error occur please try again","ApiName":ApiName,"status":"002"]
                        Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
                    }
                }
                
         
          }
        }
    }
    
    
    public func ApiHitWithRawDataFormat(ApiMethod : String, APiUrl: NSString,HeaderParameter : [String: String] , BodyParameter: NSDictionary,ApiName : String,Log : Bool,Controller : UIViewController) {
        
        let Delegate : ApiResponceDelegateARC? = Controller as? ApiResponceDelegateARC
        

        var  jsonData = NSData()
        do {
            jsonData = try JSONSerialization.data(withJSONObject: BodyParameter, options: .prettyPrinted) as NSData
        } catch {
            print(error.localizedDescription)
        }
        let urlString = APiUrl
        guard let url = URL(string: urlString as String) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = ApiMethod
        let HeaderDict : NSMutableDictionary = NSMutableDictionary.init(dictionary: HeaderParameter)
        for item in HeaderDict.allKeys {
            request.setValue(HeaderDict[item] as? String, forHTTPHeaderField: item as! String)
        }
        request.httpBody = jsonData as Data
        Alamofire.request(request).responseJSON{ (response) in
        
            if Log == true{
                print("API NAME :-  \(ApiName)")
                print("API URL :-  \(APiUrl)")
                print("API HeaderParameter :-  \(HeaderParameter)")
                print("API BodyParameter :-  \(BodyParameter)")
                print("API Result :-  \(response)")
            }
            
            let InternetCheck = NetworkReachabilityManager()!.isReachable
            if InternetCheck == false{
                let JSON = ["message":"Please check internet connection.","ApiName":ApiName,"status":"001"]
                Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
            }
            else{
                
                let statusCode = (response.response?.statusCode) ?? 0 //example : 200
                
                if statusCode == 200{
                    if let JSON = response.result.value {
                        let sessionExpireJson = JSON as! NSDictionary
                        let GetAllApiData : NSMutableDictionary = NSMutableDictionary.init(dictionary: sessionExpireJson)
                        GetAllApiData.setValue(ApiName, forKey: "ApiName")
                        Delegate?.ApiResponceSuccess(Success: GetAllApiData)
                    }
                    else{
                        let JSON = ["message":"Due to some reason error occur please try again","ApiName":ApiName,"status":"002"]
                        Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
                    }
                }
                else{
                    if let JSON = response.result.value {
                        let sessionExpireJson = JSON as! NSDictionary
                        let GetAllApiData : NSMutableDictionary = NSMutableDictionary.init(dictionary: sessionExpireJson)
                        GetAllApiData.setValue(ApiName, forKey: "ApiName")
                        Delegate?.ApiResponceFailure(Failure: GetAllApiData as NSDictionary)
                    }
                    else{
                        let JSON = ["message":"Due to some reason error occur please try again","ApiName":ApiName,"status":"002"]
                        Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
                    }
                }
                
                
            }
        }
    }
    
    
    
    public func ApiHitUsingGetMethod( APiUrl: NSString,HeaderParameter : [String: String] , BodyParameter: NSDictionary,ApiName : String,Log : Bool,Controller : UIViewController) {

        let Delegate : ApiResponceDelegateARC? = Controller as? ApiResponceDelegateARC
        var url = APiUrl
        url = url.replacingOccurrences(of: " ", with: "%20") as NSString
        URLCache.shared.removeAllCachedResponses()

        //Create a non-caching configuration.
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        config.urlCache = nil

        Alamofire.request(url as String , method: .get, parameters: BodyParameter as? Parameters,headers:HeaderParameter).responseJSON { response in

            if Log == true{
                print("API NAME :-  \(ApiName)")
                print("API URL :-  \(APiUrl)")
                print("API HeaderParameter :-  \(HeaderParameter)")
                print("API BodyParameter :-  \(BodyParameter)")
                print("API Result :-  \(response)")
            }

            let InternetCheck = NetworkReachabilityManager()!.isReachable
            if InternetCheck == false{
                let JSON = ["message":"Please check internet connection.","ApiName":ApiName,"status":"001"]
                Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
            }
            else{
                
                let statusCode = (response.response?.statusCode) ?? 0 //example : 200
                
                if statusCode == 200{
                    if let JSON = response.result.value {
                        let sessionExpireJson = JSON as! NSDictionary
                        let GetAllApiData : NSMutableDictionary = NSMutableDictionary.init(dictionary: sessionExpireJson)
                        GetAllApiData.setValue(ApiName, forKey: "ApiName")
                        Delegate?.ApiResponceSuccess(Success: GetAllApiData)
                    }
                    else{
                        let JSON = ["message":"Due to some reason error occur please try again","ApiName":ApiName,"status":"002"]
                        Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
                    }
                }
                else{
                    if let JSON = response.result.value {
                        let sessionExpireJson = JSON as! NSDictionary
                        let GetAllApiData : NSMutableDictionary = NSMutableDictionary.init(dictionary: sessionExpireJson)
                        GetAllApiData.setValue(ApiName, forKey: "ApiName")
                        Delegate?.ApiResponceFailure(Failure: GetAllApiData as NSDictionary)
                    }
                    else{
                        let JSON = ["message":"Due to some reason error occur please try again","ApiName":ApiName,"status":"002"]
                        Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
                    }
                }
                
          }
        }
    }
    
}
