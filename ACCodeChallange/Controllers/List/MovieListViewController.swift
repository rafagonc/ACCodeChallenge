//
//  MovieListViewController.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/15/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, MovieTableViewAdapterDelegate, UISearchBarDelegate {

    //MARK: UI Components
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: Properties
    let movieRepository = MovieRepository()
    let movieTableViewAdapter = MovieTableViewAdapter(movies: [])
    var page = 1
    var isLoadingData = false
    var searchText : String? = nil
    
    //MARK: Constructors
    init() {
        super.init(nibName: "MovieListViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Upcoming Movies"
        
        self.setupNavigationBar()
        self.setupSearchBar()
        self.setupTableView()
    
        getGenres { [weak self] (genreTable) in
            self?.movieTableViewAdapter.genreTable = genreTable
            self?.getUpcomingMovies()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationBar()
    }
    
    //MARK: Setups
    func setupTableView() {
        self.tableView.dataSource = movieTableViewAdapter
        self.tableView.delegate = movieTableViewAdapter
        
        self.movieTableViewAdapter.delegate = self
    }
    func setupNavigationBar() {
        if let navController = self.navigationController {
            navController.navigationBar.isHidden = true
            navController.interactivePopGestureRecognizer?.isEnabled = false
            navController.navigationBar.isTranslucent = true

        }
    }
    func setupSearchBar() {
        self.searchBar.addDoneToolbar{}
        self.searchBar.delegate = self
    }
    
    //MARK: Loading
    func startLoading() {
        self.isLoadingData = true
        if self.page == 1 {
            self.movieTableViewAdapter.update(movies: [], tableView: tableView, deleteCurrentData: true)
            self.tableView.separatorStyle = .none
            self.activityIndicator.startAnimating()
        }
    }
    
    func stopLoading() {
        self.isLoadingData = false
        if self.page == 1 {
            self.tableView.separatorStyle = .singleLine
            self.activityIndicator.stopAnimating()
        }
    }
    
    //MARK: Services
    
    func getGenres(genresServiceSuccess: @escaping (GenreTable) -> ()) {
        movieRepository.getGenres(success: { (genreTable) in
            genresServiceSuccess(genreTable)
        }) { [weak self] (error) in
            self?.showErrorAlert(title: "Error", message: error)
        }
    }
    
    func getUpcomingMovies() {
        self.startLoading()
            movieRepository.listUpcomingMovies(page: self.page, success: { [weak self] (movies) in
                self?.movieTableViewAdapter.update(movies:movies, tableView:  self?.tableView, deleteCurrentData:self?.page == 1)
                self?.stopLoading()
            }) { [weak self] (error) in
                self?.stopLoading()
                self?.showErrorAlert(title: "Error", message: error)
            }
    }
    
    func getMovieBySearchText() {
        self.startLoading()
        if let searchText = self.searchText {
            movieRepository.searchMovies(query: searchText, page: self.page, success: { [weak self] (movies) in
                self?.movieTableViewAdapter.update(movies:movies, tableView:  self?.tableView, deleteCurrentData:self?.page == 1)
                self?.stopLoading()
            }) { [weak self] (error) in
                self?.stopLoading()
                self?.showErrorAlert(title: "Error", message: error)
            }
        }
    }
    
    //MARK: Helpers
    func isSearching() -> Bool {
        return self.searchText != nil
    }
    
    func loadMoreData() {
        if self.isSearching() {
            self.getMovieBySearchText()
        } else {
            self.getUpcomingMovies()
        }
    }
    
    //MARK: Delegates
    func movieTableViewAdapterWantsToPaginate() {
        if self.isLoadingData == false {
            page += 1
            loadMoreData()
        }
    }
    
    func movieTableViewAdapterDidSelectMovie(movie: Movie) {
        self.navigationController?.pushViewController(MovieDetailViewController(movieId: movie.id), animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.page = 1
        if searchText.count == 0 {
            self.searchText = nil
            self.titleLabel.text = "Upcoming Movies"
            self.title = self.titleLabel.text
        } else {
            self.searchText = searchText
            self.titleLabel.text = searchText
            self.title = self.titleLabel.text
        }
        loadMoreData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

}
