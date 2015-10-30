//
//  RequestController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 28..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


struct MyCart {
    var name : String
}

class RequestController {
    var myCart : [MyCart]
    static let sharedManger = RequestController()
    let manager: Manager
    
    init() {
        var defaultHeaders = Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
        defaultHeaders["X-Parse-REST-API-Key"] = "uEC0utMdVvkdqCv6ISVjWY80MKfmfJ1FVwQvPsF1"
        defaultHeaders["X-Parse-Application-Id"] = "iYALmYFJyCfubJMtf4zHgR5uMa3GZq2oYIHOS8c2"
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = defaultHeaders
        manager = Alamofire.Manager(configuration: configuration)
        myCart = [MyCart]()
    }
  
    func sendRequestGET() {
        manager.request(.GET, "https://api.parse.com/1/classes/CartItem")
            .responseJSON { response in
                let json = JSON(response.result.value!)
            
                for (_, subJson):(String, JSON) in json["results"] {
                    let name = subJson["name"].string
                    self.myCart.append(MyCart(name: name!))
            }
            NSNotificationCenter.defaultCenter().postNotificationName("CartChanged", object: nil)
        }
    }
    
    func sendRequestPOST(data: String) {
        let bodyParameters = [
            "name": data
        ]
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        manager.request(.POST, "https://api.parse.com/1/classes/CartItem", parameters: bodyParameters, encoding: encoding)
            .validate(statusCode: 200..<300)
            .responseJSON{ response in
                guard response.result.error==nil else {
                    return
                }
                print("success")
        }
    }
}