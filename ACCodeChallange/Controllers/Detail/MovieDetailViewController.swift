//
//  MovieDetailViewController.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/15/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import UIKit
import Kingfisher


class MovieDetailViewController: UIViewController {

    let movieId : Int
    let movieRepository = MovieRepository()

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: Constructors
    init(movieId: Int) {
        self.movieId = movieId
        super.init(nibName: "MovieDetailViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.movieId = 0
        super.init(coder: aDecoder)
    }
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        
        self.getMovie()
        
    }
    
    //MARK: Setups
    func setupNavigationBar() {
        if let navController = self.navigationController {
            navController.navigationBar.isHidden = false
            navController.navigationBar.clearNavigationBar()
        }
    }
    
    func setupMovieViews(movie: Movie) {
        self.movieTitleLabel.text = movie.title
        self.runtimeLabel.text = movie.runtime != nil ? "\(movie.runtime!)m" : "Unknown duration"
        self.genreLabel.text = movie.getGenresJoinedByComma()
        self.ratingLabel.text = "\(String.init(format: "%.1f", movie.voteAverage!))"
        self.descriptionLabel.text = movie.overview ?? "No description available"
        
        if let backdropPath = movie.backdropPath {
            self.posterImageView.kf.indicatorType = .activity
            let processor = BlurImageProcessor(blurRadius: 20)
            self.backdropImageView.kf.setImage(with: URL(string: backdropPath), options: [.processor(processor)])
        }
        
        if let posterPath = movie.posterPath {
            self.posterImageView.kf.indicatorType = .activity
            self.posterImageView.kf.setImage(with: URL(string: posterPath))
        }
    }
    
    //MARK: Loading
    func startLoading() {
        self.contentView.isHidden = true
        self.activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        self.contentView.isHidden = false
        self.activityIndicator.stopAnimating()
    }
    
    //MARK: Service
    func getMovie() {
        startLoading()
        self.movieRepository.detailMovie(movieId: self.movieId, success: { [weak self] (movie) in
            self?.setupMovieViews(movie: movie)
            self?.stopLoading()
        }) { [weak self] (error) in
            self?.showErrorAlert(title: "Error", message: error)
            self?.stopLoading()
        }
    }

}
