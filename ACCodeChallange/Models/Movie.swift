//
//  Movie.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 15, 2019

import Foundation
import SwiftyJSON


class Movie {

    var adult : Bool!
    var backdropPath : String!
    var budget : Int!
    var genres : [Genre]!
    var homepage : String!
    var id : Int!
    var imdbId : String!
    var originalLanguage : String!
    var originalTitle : String!
    var overview : String!
    var popularity : Float!
    var posterPath: String!
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
        
        adult = json["adult"].boolValue
        posterPath = json["posterPath"].stringValue
        backdropPath = json["backdrop_path"].stringValue
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
        
        genres = [Genre]()
        let genresArray = json["genres"].arrayValue
        for genresJson in genresArray{
            let value = Genre(fromJson: genresJson)
            genres.append(value)
        }
        
        productionCompanies = [ProductionCompany]()
        let productionCompaniesArray = json["production_companies"].arrayValue
        for productionCompaniesJson in productionCompaniesArray{
            let value = ProductionCompany(fromJson: productionCompaniesJson)
            productionCompanies.append(value)
        }
        productionCountries = [ProductionCountry]()
        let productionCountriesArray = json["production_countries"].arrayValue
        for productionCountriesJson in productionCountriesArray{
            let value = ProductionCountry(fromJson: productionCountriesJson)
            productionCountries.append(value)
        }

        spokenLanguages = [SpokenLanguage]()
        let spokenLanguagesArray = json["spoken_languages"].arrayValue
        for spokenLanguagesJson in spokenLanguagesArray{
            let value = SpokenLanguage(fromJson: spokenLanguagesJson)
            spokenLanguages.append(value)
        }
	}

}
