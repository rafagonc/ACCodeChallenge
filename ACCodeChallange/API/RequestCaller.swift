//
//  RequestCaller.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/15/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RequestCaller {
    
    static let APIKey = "1f54bd990f1cdfb230adb312546d765d"
    
    static func getAlamofireHTTPMethod(method: Method) -> HTTPMethod {
        return ["POST": HTTPMethod.post,
                "GET": HTTPMethod.get,
                "PATCH": HTTPMethod.patch,
                "DELETE": HTTPMethod.delete,
                "PUT": HTTPMethod.put][method.rawValue]!
    }
    
    static func makeRequest(request: Request, success : @escaping ((JSON) -> (Void)), failure : @escaping ((String) -> (Void))) {
        let url = Endpoint.Production.rawValue + request.path(apiKey: APIKey)
        let httpMethod = self.getAlamofireHTTPMethod(method: request.method())
        RequestLogger.logRequest(url: url, request: request)
        Alamofire.request(url, method: httpMethod, parameters: (httpMethod != .get ? request.body() : nil), encoding: JSONEncoding.default, headers:  request.headers()).response { (response) in
            RequestLogger.logResponse(response: response)
            if let _ = response.error {
                failure("There was an error connecting to the server. Try again later")
            } else {
                do {
                    let json = try JSON(data: response.data!)
                    success(json)
                } catch (_) {
                    failure("There was an error connecting to the server. Try again later")
                }
                
            }
        }
    }
    
}
