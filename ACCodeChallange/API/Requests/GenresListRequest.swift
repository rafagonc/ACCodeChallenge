//
//  GenresListRequest
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/16/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import Foundation

class GenresListRequest: Request {
    
    let language : String
    
    init(language: String = "en-US") {
        self.language = language
    }
    
    func path(apiKey: String) -> String {
        return "/genre/movie/list?api_key=\(apiKey)"
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
