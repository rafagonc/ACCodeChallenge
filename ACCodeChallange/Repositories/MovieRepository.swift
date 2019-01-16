//
//  MovieRepository.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/15/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieRepository {
    
    func listUpcomingMovies(page: Int, success: @escaping ([Movie]) -> (), failure: @escaping (String) -> ()) {
        RequestCaller.makeRequest(request: UpcomingMoviesRequest(page: page), success: { (response) -> (Void) in
            success(((response["results"].array ?? [JSON]()).map({ (response_item) -> Movie in
                return Movie(fromJson: response_item)
            })))
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func searchMovies(query: String, page:Int, success: @escaping ([Movie]) -> (), failure: @escaping (String) -> ()) {
        RequestCaller.makeRequest(request: SearchMoviesRequest(query: query, page: page), success: { (response) -> (Void) in
            success(((response["results"].array ?? [JSON]()).map({ (response_item) -> Movie in
                return Movie(fromJson: response_item)
            })))
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func detailMovie(movie_id: Int, success: @escaping (Movie) -> (), failure: @escaping (String) -> ()) {
        RequestCaller.makeRequest(request: DetailMovieRequest(movie_id: movie_id), success: { (response) -> (Void) in
            success(Movie(fromJson: response))
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
}
