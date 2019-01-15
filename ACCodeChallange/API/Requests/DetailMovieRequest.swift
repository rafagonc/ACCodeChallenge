//
//  DetailMovieRequest.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/15/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import Foundation

class DetailMovieRequest: Request {
    
    let movie_id : Int
    let language : String
    
    init(movie_id: Int, language: String = "en-US") {
        self.movie_id = movie_id
        self.language = language
    }
    
    func path(apiKey: String) -> String {
        return "/movies/id?id=\(self.movie_id)&language=\(self.language)&api_key=\(apiKey)"
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

