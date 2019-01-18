//
//  MovieDatasource.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/16/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import UIKit

protocol MovieTableViewAdapterDelegate {
    
    func movieTableViewAdapterWantsToPaginate()
    func movieTableViewAdapterDidSelectMovie(movie: Movie)
    
}

class MovieTableViewAdapter: NSObject, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    var movies : [Movie]
    var delegate : MovieTableViewAdapterDelegate?
    var genreTable : GenreTable?
    
    init(movies: [Movie]) {
        self.movies = movies
    }
    
    func update(movies: [Movie], tableView: UITableView?, deleteCurrentData : Bool = false) {
        if deleteCurrentData {
            self.movies = movies
        } else {
            self.movies.append(contentsOf: movies)
        }
        tableView?.reloadData()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "MovieItemTableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? MovieItemTableViewCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed(cellID, owner: self, options: nil)?.first as? MovieItemTableViewCell
        }
        cell?.setMovieContent(movie: self.movies[indexPath.row], genreTable: self.genreTable)
        cell?.selectionStyle = .none
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = self.delegate {
            delegate.movieTableViewAdapterDidSelectMovie(movie: self.movies[indexPath.row])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y - (scrollView.contentSize.height - scrollView.frame.size.height)
        if yOffset > -10 {
            if let delegate = self.delegate {
                delegate.movieTableViewAdapterWantsToPaginate()
            }
        }
    }
}
