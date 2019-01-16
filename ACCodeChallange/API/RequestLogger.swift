//
//  RequestLogger.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/15/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import Foundation
import Alamofire

class RequestLogger {
    
    static func logRequest(url: String, request: Request) {
        print("📤 #########REQUEST########### 📤")
        print("Request Url: \(url)")
        print("Request Method: \(request.method())")
        print("Request Headers: \(request.headers())")
        print("Request Body: \(request.body())")
    }
    
    static func logResponse(response: DefaultDataResponse) {
        print("📥 #########RESPONSE########### 📥")
        if let statusCode = response.response?.statusCode {
            print("Response Status: \(statusCode)")
        }
        if let body = response.data {
            print("Response Body: \(String.init(data: body, encoding: .utf8) ?? "Could not parse response body as a string")")
        }
        let dataAsString = String(describing: String.init(data: response.data ?? Data.init(), encoding: .utf8))
        let index = dataAsString.index(dataAsString.startIndex, offsetBy: 120)
        print("Response Body: \(dataAsString[..<index]))")
        
        if let error = response.error {
            print("Response Error: \(error)")
        }
        print("Response Headers: \(response.response?.allHeaderFields ?? [:])")
    }
    
}
