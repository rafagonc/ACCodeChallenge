//
//  MovieItemTableViewCell.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/16/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import UIKit
import Kingfisher

class MovieItemTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    func setMovieContent(movie: Movie) {
        self.titleLabel.text = movie.originalTitle
        self.subtitleLabel.text = movie.overview
        if let posterPath = movie.posterPath {
            self.posterImageView.kf.indicatorType = .activity
            self.posterImageView.kf.setImage(with: URL.init(string: posterPath))
        }

    }
    
}
