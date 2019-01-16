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
    
        self.getUpcomingMovies()
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
        }
    }
    
    func setupSearchBar() {
        self.searchBar.addDoneToolbar{}
        self.searchBar.delegate = self
    }
    
    //MARK: Services
    func getUpcomingMovies() {
        isLoadingData = true
            movieRepository.listUpcomingMovies(page: self.page, success: { [weak self] (movies) in
                self?.movieTableViewAdapter.update(movies:movies, tableView:  self?.tableView, deleteCurrentData:self?.page == 1)
                self?.isLoadingData = false
            }) { [weak self] (error) in
                self?.isLoadingData = false
                self?.showErrorAlert(title: "Error", message: error)
            }
    }
    
    func getMovieBySearchText() {
        isLoadingData = true
        if let searchText = self.searchText {
            movieRepository.searchMovies(query: searchText, page: self.page, success: { [weak self] (movies) in
                self?.movieTableViewAdapter.update(movies:movies, tableView:  self?.tableView, deleteCurrentData:self?.page == 1)
                self?.isLoadingData = false
            }) { [weak self] (error) in
                self?.isLoadingData = false
                self?.showErrorAlert(title: "Error", message: error)
            }
        }
    }
    
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
        if isLoadingData == false {
            page += 1
            loadMoreData()
        }
    }
    
    func movieTableViewAdapterDidSelectMovie(movie: Movie) {
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            self.searchText = nil
            self.page = 1
            self.loadMoreData()
        } else {
            self.searchText = searchText
            self.page = 1
            loadMoreData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

}
