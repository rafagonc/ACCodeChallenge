//
//  APIRequest.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/15/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import Foundation

enum Method: String  {
    case POST = "POST"
    case GET = "GET"
    case PATCH = "PATCH"
    case DELETE = "DELETE"
    case PUT = "PUT"
}

protocol Request {
    
    func path(apiKey: String) -> String;
    func method() -> Method;
    func headers() -> [String:String];
    func body() -> [String:Any];
}
