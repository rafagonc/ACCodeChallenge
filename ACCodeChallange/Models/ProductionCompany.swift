//
//  ProductionCompany.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 15, 2019

import Foundation
import SwiftyJSON


class ProductionCompany {

    var id : Int!
    var logoPath : String!
    var name : String!
    var originCountry : String!

	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        id = json["id"].intValue
        logoPath = json["logo_path"].stringValue
        name = json["name"].stringValue
        originCountry = json["origin_country"].stringValue
	}

}
