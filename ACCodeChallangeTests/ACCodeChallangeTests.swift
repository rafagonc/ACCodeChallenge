//
//  ACCodeChallangeTests.swift
//  ACCodeChallangeTests
//
//  Created by Rafael Gonzalves on 1/15/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import XCTest
@testable import ACCodeChallange

class ACCodeChallangeTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testUpcomingMoviesRequestCall() {
        let expectation = XCTestExpectation(description: "List upcoming movies request call")
        let movieRepo = MovieRepository()
        movieRepo.listUpcomingMovies(page: 1, success: { (movies) in
            XCTAssert(movies.count > 0)
            expectation.fulfill()
        }) { (error) in
            XCTFail("Upcoming movies request call failed!")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 20.0)
    }
    
    func testGetMovieByIDRequestCall() {
        let expectation = XCTestExpectation(description: "Get movie by ID request call")
        let movieRepo = MovieRepository()
        movieRepo.detailMovie(movie_id: 504172, success: { (movie) in
            XCTAssertNotNil(movie.title)
            expectation.fulfill()
        }) { (error) in
            XCTFail("Get movie by ID request call failed!")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 20.0)
    }
}
