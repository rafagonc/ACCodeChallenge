//
//  Movie.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 15, 2019

import Foundation
import SwiftyJSON


class Movie {

    var adult : Bool!
    var backdropPath : String?
    var budget : Int!
    var genres : [Genre]!
    var homepage : String!
    var id : Int!
    var imdbId : String!
    var originalLanguage : String!
    var originalTitle : String!
    var overview : String!
    var popularity : Float!
    var posterPath: String?
    var productionCompanies : [ProductionCompany]!
    var productionCountries : [ProductionCountry]!
    var releaseDate : String!
    var revenue : Int!
    var runtime : Int!
    var spokenLanguages : [SpokenLanguage]!
    var status : String!
    var tagline : String!
    var title : String!
    var video : Bool!
    var voteAverage : Float!
    var voteCount : Int!

	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        
        if let _ = json["poster_path"].string {
            posterPath = "https://image.tmdb.org/t/p/w500/\(json["poster_path"].stringValue)?api_key=\(RequestCaller.APIKey)"
        }
        
        
        if let _ = json["backdrop_path"].string {
            backdropPath = "https://image.tmdb.org/t/p/w500/\(json["backdrop_path"].stringValue)?api_key=\(RequestCaller.APIKey)"
        }
        
        adult = json["adult"].boolValue
        
        backdropPath = "https://image.tmdb.org/t/p/w500/\(json["backdrop_path"].stringValue)?api_key=\(RequestCaller.APIKey)"
        budget = json["budget"].intValue
        homepage = json["homepage"].stringValue
        id = json["id"].intValue
        imdbId = json["imdb_id"].stringValue
        originalLanguage = json["original_language"].stringValue
        originalTitle = json["original_title"].stringValue
        overview = json["overview"].stringValue
        popularity = json["popularity"].floatValue
        releaseDate = json["release_date"].stringValue
        revenue = json["revenue"].intValue
        runtime = json["runtime"].intValue
        status = json["status"].stringValue
        tagline = json["tagline"].stringValue
        title = json["title"].stringValue
        video = json["video"].boolValue
        voteAverage = json["vote_average"].floatValue
        voteCount = json["vote_count"].intValue
        
        setGenres(json: json)
        setProductionCompaies(json: json)
        setProductionCountries(json: json)
        setSpokenLanguages(json: json)

	}
    
    func setGenres(json: JSON) {
        genres = [Genre]()
        let genresArray = json["genres"].array ?? []
        for genresJson in genresArray{
            let value = Genre(fromJson: genresJson)
            genres.append(value)
        }
    }
    func setProductionCompaies(json: JSON) {
        productionCompanies = [ProductionCompany]()
        let productionCompaniesArray = json["production_companies"].array ?? []
        for productionCompaniesJson in productionCompaniesArray{
            let value = ProductionCompany(fromJson: productionCompaniesJson)
            productionCompanies.append(value)
        }
    }
    
    func setProductionCountries(json: JSON) {
        productionCountries = [ProductionCountry]()
        let productionCountriesArray = json["production_countries"].array ?? []
        for productionCountriesJson in productionCountriesArray{
            let value = ProductionCountry(fromJson: productionCountriesJson)
            productionCountries.append(value)
        }
    }
    
    
    func setSpokenLanguages(json: JSON) {
        spokenLanguages = [SpokenLanguage]()
        let spokenLanguagesArray = json["spoken_languages"].array ?? []
        for spokenLanguagesJson in spokenLanguagesArray{
            let value = SpokenLanguage(fromJson: spokenLanguagesJson)
            spokenLanguages.append(value)
        }
    }

}
