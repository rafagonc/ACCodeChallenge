//
//  DetailMovieRequest.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/15/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import Foundation

class DetailMovieRequest: Request {
    
    let movieId : Int
    let language : String
    
    init(movieId: Int, language: String = "en-US") {
        self.movieId = movieId
        self.language = language
    }
    
    func path(apiKey: String) -> String {
        return "/movie/\(self.movieId)?api_key=\(apiKey)&language=\(self.language)"
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

