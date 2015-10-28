//
//  RequestController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 28..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import Foundation
import Alamofire

class RequestController {
    static let sharedManger = RequestController()
    
    let headers = [
        "X-Parse-Rest-API-Key":"uEC0utMdVvkdqCv6ISVjWY80MKfmfJ1FVwQvPsF1",
        "X-Parse-Application-Id":"iYALmYFJyCfubJMtf4zHgR5uMa3GZq2oYIHOS8c2",
        "Content-Type":"application/json"
    ]
    
    func sendRequestPOST(data: String) {
        // JSON Body
        let bodyParameters = [
            "name": data
        ]
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        // Fetch Request
        Alamofire.request(.POST, "https://api.parse.com/1/classes/CartItem", parameters: bodyParameters, encoding: encoding, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON{ response in
                guard response.result.error==nil else {
                    return
                }
                print("success")
        }
    }
}