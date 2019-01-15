//
//  APIRequest.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/15/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import Foundation

protocol APIRequest {
    
    func path() -> String;
//    func method() -> HTTPMethod;
    func headers() -> [String:String];
    func body() -> [String:Any];
    func isAuthenticated() -> Bool
}
