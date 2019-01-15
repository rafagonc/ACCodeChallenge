//
//  UpcomingMoviesRequest.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/15/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import Foundation

class UpcomingMoviesRequest: Request {
    
    let page : Int
    let language : String
    
    init(page: Int, language: String = "en-US") {
        self.page = page
        self.language = language
    }
    
    func path(apiKey: String) -> String {
        return "/movies/upcoming?page=\(self.page)&language=\(self.language)&api_key=\(apiKey)"
    }
    
    func method() -> Method {
        return .GET
    }
    
    func body() -> [String : Any] {
        return [:]
    }
    
    func headers() -> [String : String] {
        return [:]
    }
}

