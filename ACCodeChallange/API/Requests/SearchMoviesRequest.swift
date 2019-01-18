//
//  SearchMoviesRequest.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/16/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import Foundation

class SearchMoviesRequest: Request {
    
    let page : Int
    let query : String
    let language : String
    
    init(query: String, page:Int, language: String = "en-US") {
        self.query = query
        self.page = page
        self.language = language
    }
    
    func path(apiKey: String) -> String {
        return "/search/movie?query=\(self.query.replacingOccurrences(of: " ", with: "%20"))&page=\(self.page)&language=\(self.language)&api_key=\(apiKey)"
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
