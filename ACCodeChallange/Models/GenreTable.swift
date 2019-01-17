//
//  GenreTable.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/17/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import Foundation

class GenreTable {
    
    let genres : [Genre]
    
    init(genres: [Genre]) {
        self.genres = genres
    }
    
    func findGenreNameById(id: Int) -> String? {
        let filteredGenres = self.genres.filter({ (genre) -> Bool in
            return genre.id == id
        })
        return filteredGenres.count > 0 ? filteredGenres[0].name : nil
    }
    
}
